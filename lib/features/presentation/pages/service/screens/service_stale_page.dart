import 'package:bakery_app/features/data/models/service_received_stale.dart';
import 'package:bakery_app/features/data/models/service_stale.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/toast_message.dart';
import '../../../widgets/available_product.dart';
import '../../../widgets/custom_app_bar.dart';
import '../../../widgets/custom_confirmation_dialog.dart';
import '../../../widgets/custom_update_quantity_dialog.dart';
import '../../../widgets/editable_added_product.dart';
import '../../../widgets/empty_content.dart';
import '../../../widgets/error_animation.dart';
import '../../../widgets/loading_indicator.dart';
import '../bloc/service_stale_left/service_stale_left_bloc.dart';
import '../bloc/service_stale_received/service_stale_received_bloc.dart';

class ServiceStalePage extends StatelessWidget {
  static const String routeName = "service-stale-page";
  final DateTime date;
  const ServiceStalePage({super.key, required this.date});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(
        title: "Servis Bayatı",
        onTap: () {
          Navigator.pop(context);
        },
      ),
      body: _buildBody(context),
    );
  }

  _buildBody(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      double screenHeight = constraints.maxHeight;
      double sectionHeight = screenHeight * 0.5;
      return Column(
        children: [
          SizedBox(
            height: sectionHeight,
            child: _getNotReceivedStaleMarkets(context),
          ),
          SizedBox(
            height: sectionHeight,
            child: _getReceivedStaleMarkets(context),
          ),
        ],
      );
    });
  }

  _getNotReceivedStaleMarkets(BuildContext context) {
    List<TextEditingController> controllers = List.empty(growable: true);
    context
        .read<ServiceStaleLeftBloc>()
        .add(ServiceGetStaleLeftRequested(date: date));

    return BlocBuilder<ServiceStaleLeftBloc, ServiceStaleLeftState>(
        builder: ((context, state) {
      return switch (state) {
        ServiceStaleLeftLoading() => const LoadingIndicator(),
        ServiceStaleLeftFailure() => const ErrorAnimation(),
        ServiceStaleLeftSuccess() => state.serviceStaleLeft!.isEmpty
            ? const EmptyContent()
            : Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    color: Colors.white,
                    padding: const EdgeInsets.all(8),
                    child: const Center(
                      child: Text(
                        "Marketler",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: state.serviceStaleLeft!.length,
                      itemBuilder: (context, index) {
                        controllers.add(TextEditingController());
                        return AvailableProductWidget(
                            productName:
                                state.serviceStaleLeft![index].marketName,
                            controller: controllers[index],
                            index: index,
                            onPressed: () {
                              if (controllers[index].text.isNotEmpty) {
                                _receiveStaleBreadFromMarket(
                                    context,
                                    state.serviceStaleLeft![index],
                                    int.parse(controllers[index].text));
                                controllers[index].clear();
                              } else {
                                showToastMessage("Bir sayı girmelisiniz!");
                              }
                            });
                      },
                    ),
                  ),
                ],
              ),
      };
    }));
  }

  _getReceivedStaleMarkets(BuildContext context) {
    context
        .read<ServiceStaleReceivedBloc>()
        .add(ServiceGetReceivedStaleRequested(date: date));
    return BlocBuilder<ServiceStaleReceivedBloc, ServiceStaleReceivedState>(
        builder: ((context, state) {
      return switch (state) {
        ServiceStaleReceivedLoading() => const LoadingIndicator(),
        ServiceStaleReceivedFailure() => const ErrorAnimation(),
        ServiceStaleReceivedSuccess() => state.serviceReceivedStale!.isEmpty
            ? const EmptyContent()
            : Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8),
                    child: Center(
                      child: Text(
                        "Bayat Alınan Marketler",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: state.serviceReceivedStale!.length,
                      itemBuilder: (context, index) {
                        return EditableAddedProduct(
                            productName:
                                state.serviceReceivedStale![index].marketName,
                            quantity:
                                state.serviceReceivedStale![index].quantity,
                            onEditPressed: () {
                              _updateReceivedStaleMarket(context,
                                  state.serviceReceivedStale![index], index);
                            },
                            onDeletePressed: () {
                              _removeReceivedStaleMarket(
                                  context, state.serviceReceivedStale![index]);
                            },
                            index: index);
                      },
                    ),
                  ),
                ],
              ),
      };
    }));
  }

  _updateReceivedStaleMarket(BuildContext context,
      ServiceReceivedStaleModel serviceReceivedStaleModel, int index) {
    TextEditingController controller = TextEditingController(
        text: serviceReceivedStaleModel.quantity.toString());
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return UpdateQuantityDialog(
              controller: controller,
              content:
                  "${serviceReceivedStaleModel.marketName} marketten alınan bayat adedini güncellemek için emin misiniz?",
              onSave: (newQuantity) {
                if (newQuantity == serviceReceivedStaleModel.quantity) {
                  return;
                }
                context
                    .read<ServiceStaleReceivedBloc>()
                    .add(ServiceUpdateReceivedStaleRequested(
                      serviceReceivedStaleModel: ServiceReceivedStaleModel(
                          id: serviceReceivedStaleModel.id,
                          marketId: serviceReceivedStaleModel.marketId,
                          marketName: serviceReceivedStaleModel.marketName,
                          quantity: newQuantity),
                    ));
              },
              title: "Güncelleme");
        });
  }

  _removeReceivedStaleMarket(BuildContext context,
      ServiceReceivedStaleModel serviceReceivedStaleModel) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return CustomConfirmationDialog(
              title: 'Silme',
              content:
                  '${serviceReceivedStaleModel.marketName} marketten alınan bayatlerı silmek için emin misiniz?',
              onTap: () {
                context.read<ServiceStaleReceivedBloc>().add(
                    ServiceRemoveReceivedStaleRequested(
                        context: context,
                        serviceReceivedStaleModel: serviceReceivedStaleModel));
              });
        });
  }

  _receiveStaleBreadFromMarket(BuildContext context,
      ServiceStaleModel serviceStaleModel, int staleQuantity) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return CustomConfirmationDialog(
              title: 'Bayat Alma',
              content:
                  '${serviceStaleModel.marketName} marketten $staleQuantity bayat alındı onaylıyor musunuz?',
              onTap: () {
                context.read<ServiceStaleLeftBloc>().add(
                    ServicePostAccountLeftRequested(
                        context: context,
                        serviceStaleModel: serviceStaleModel,
                        staleQuantity: staleQuantity));
              });
        });
  }
}
