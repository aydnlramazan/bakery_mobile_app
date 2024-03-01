import 'package:bakery_app/features/data/models/service_account_left.dart';
import 'package:bakery_app/features/data/models/service_account_received.dart';
import 'package:bakery_app/features/presentation/pages/service/bloc/service_account_left/service_account_left_bloc.dart';
import 'package:bakery_app/features/presentation/pages/service/bloc/service_account_received/service_account_received_bloc.dart';
import 'package:bakery_app/features/presentation/widgets/custom_confirmation_dialog.dart';
import 'package:bakery_app/features/presentation/widgets/custom_payment_dialog.dart';
import 'package:bakery_app/features/presentation/widgets/paid_market.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/toast_message.dart';
import '../../../widgets/custom_app_bar.dart';

import '../../../widgets/empty_content.dart';
import '../../../widgets/error_animation.dart';
import '../../../widgets/loading_indicator.dart';
import '../../../widgets/not_paid_market.dart';

class ServiceAccountPage extends StatelessWidget {
  static const String routeName = "service-account-page";
  final DateTime date;
  const ServiceAccountPage({super.key, required this.date});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(
        title: "Servis Hesabı",
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
            child: _getNotPaidMarkets(context),
          ),
          SizedBox(
            height: sectionHeight,
            child: _getPaidMarkets(context),
          ),
        ],
      );
    });
  }

  _getNotPaidMarkets(BuildContext context) {
    context.read<ServiceAccountLeftBloc>().add(ServiceGetAccountLeftRequested(date: date));

    return BlocBuilder<ServiceAccountLeftBloc, ServiceAccountLeftState>(
        builder: ((context, state) {
      return switch (state) {
        ServiceAccountLeftLoading() => const LoadingIndicator(),
        ServiceAccountLeftFailure() => const ErrorAnimation(),
        ServiceAccountLeftSuccess() => state.serviceAccountLeft!.isEmpty
            ? const EmptyContent()
            : Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    color: Colors.white,
                    padding: const EdgeInsets.all(8),
                    child: const Center(
                      child: Text(
                        "Marketler Listsi",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: state.serviceAccountLeft!.length,
                      itemBuilder: (context, index) {
                        return NotPaidMarket(
                            staleBread:
                                state.serviceAccountLeft![index].staleBread,
                            marketName:
                                state.serviceAccountLeft![index].marketName,
                            givenBread:
                                state.serviceAccountLeft![index].givenBread,
                            totalAmount:
                                state.serviceAccountLeft![index].totalAmount,
                            index: index,
                            onTap: () {
                              _showPaymentDialog(
                                  context, state.serviceAccountLeft![index]);
                            });
                      },
                    ),
                  ),
                ],
              ),
      };
    }));
  }

  _showPaymentDialog(BuildContext context, ServiceAccountLeftModel accountLeftModel) {
    TextEditingController controller =TextEditingController(text: accountLeftModel.totalAmount.toString());

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return CustomPaymentDialog(
              title: accountLeftModel.marketName,
              firstText:
                  ('Toplam Adet: ${accountLeftModel.givenBread - accountLeftModel.staleBread}'),
              secondText: 'Toplam Tutar: ${accountLeftModel.totalAmount}',
              controller: controller,
              onSave: (paidAmount)  {
                if (paidAmount > accountLeftModel.totalAmount) {
                  showToastMessage("Tutardan fazla sayı girilmez!");
                  return;
                }
                context.read<ServiceAccountLeftBloc>().add(
                    ServicePostAccountLeftRequested(
                        context: context,
                        serviceAccountLeftModel: accountLeftModel,
                        paidAmount: paidAmount));
              });
        });
  }

  _getPaidMarkets(BuildContext context) {
    context.read<ServiceAccountReceivedBloc>().add(ServiceGetAccountReceivedRequested(date: date));
    return BlocBuilder<ServiceAccountReceivedBloc, ServiceAccountReceivedState>(
        builder: ((context, state) {
      return switch (state) {
        ServiceAccountReceivedLoading() => const LoadingIndicator(),
        ServiceAccountReceivedFailure() => const ErrorAnimation(),
        ServiceAccountReceivedSuccess() => state.serviceAccountReceived!.isEmpty
            ? const EmptyContent()
            : Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                   Padding(
                    padding:const EdgeInsets.all(8),
                    child: Center(
                      child:Text(
                        "Toplam Alınan ödemler: ${_getReceivedPayment(state.serviceAccountReceived)}",
                        style:const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: state.serviceAccountReceived!.length,
                      itemBuilder: (context, index) {
                        return PaidMarket(
                            marketName:
                                state.serviceAccountReceived![index].marketName,
                            totalAmount: state
                                .serviceAccountReceived![index].totalAmount,
                            receivedAmount:
                                state.serviceAccountReceived![index].amount,
                            onEditPressed: () {
                              _updateReceivedMarket(context,
                                  state.serviceAccountReceived![index]);
                            },
                            onDeletePressed: () {
                              _removeReceivedMarket(context,
                                  state.serviceAccountReceived![index]);
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

  _updateReceivedMarket(BuildContext context,ServiceAccountReceivedModel receivedModel) {
    TextEditingController controller =TextEditingController(text: receivedModel.amount.toString());
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return CustomPaymentDialog(
              controller: controller,
              firstText: 'Toplam Tutar: ${receivedModel.totalAmount}',
              secondText: 'Yapılan Ödeme: ${receivedModel.amount}',
              onSave: (newAmount) {
                if (newAmount > receivedModel.totalAmount) {
                  showToastMessage("Tutardan fazla sayı girilmez!");
                  return;
                }
                if (newAmount != receivedModel.amount) {
                  context.read<ServiceAccountReceivedBloc>().add(
                      ServiceUpdateAccountReceivedRequested(
                          serviceAccountReceivedModel:
                              ServiceAccountReceivedModel(
                                  id: receivedModel.id,
                                  amount: newAmount,
                                  marketId: receivedModel.marketId,
                                  marketName: receivedModel.marketName,
                                  totalAmount: receivedModel.totalAmount,
                                  staleBread: receivedModel.staleBread,
                                  givenBread: receivedModel.givenBread)));
                }
              },
              title: receivedModel.marketName);
        });
  }

  _removeReceivedMarket(BuildContext context, ServiceAccountReceivedModel receivedModel) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return CustomConfirmationDialog(
              title: 'Silme',
              content: '${receivedModel.marketName} market\'in ödemesini silmek için emin misiniz?',
              onTap: () {
                context.read<ServiceAccountReceivedBloc>().add(
                    ServiceRemoveAccountReceivedRequested(
                        context: context,
                        serviceAccountReceivedModel: receivedModel));
              });
        });
  }
  
 String _getReceivedPayment(List<ServiceAccountReceivedModel>? serviceAccountReceived) {
 if (serviceAccountReceived == null || serviceAccountReceived.isEmpty) {
    return '0.0'; 
  }
  double totalAmount = serviceAccountReceived.fold(0.0, (sum, item) => sum + item.amount);

  return totalAmount.toString();
  }
}
