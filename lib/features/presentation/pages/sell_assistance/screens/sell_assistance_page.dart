import 'package:bakery_app/features/data/models/product_counting_added.dart';
import 'package:bakery_app/features/data/models/received_money_from_service.dart';
import 'package:bakery_app/features/data/models/stale_bread.dart';
import 'package:bakery_app/features/data/models/stale_bread_added.dart';
import 'package:bakery_app/features/data/models/stale_product_added.dart';
import 'package:bakery_app/features/presentation/pages/production/screens/production_page.dart';
import 'package:bakery_app/features/presentation/pages/sell_assistance/bloc/bread_counting/bread_counting_bloc.dart';
import 'package:bakery_app/features/presentation/pages/sell_assistance/bloc/product_counting_added/product_counting_added_bloc.dart';
import 'package:bakery_app/features/presentation/widgets/custom_cash_counting_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bakery_app/features/data/models/expense.dart';
import 'package:bakery_app/features/data/models/given_product_to_service.dart';
import 'package:bakery_app/features/data/models/service_stale_product.dart';
import 'package:bakery_app/features/data/models/user.dart';
import 'package:bakery_app/features/presentation/pages/sell_assistance/bloc/given_product_to_service/given_product_to_service_bloc.dart';
import 'package:bakery_app/features/presentation/pages/sell_assistance/bloc/service_stale_product/service_stale_product_bloc.dart';
import 'package:bakery_app/features/presentation/widgets/custom_expense_dialog.dart';
import 'package:bakery_app/features/presentation/widgets/custom_receive_amount_dialog.dart';
import 'package:bakery_app/features/presentation/widgets/custom_sell_list_tile.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../../core/constants/global_variables.dart';
import '../../../../../core/utils/is_today_check.dart';
import '../../../../../core/utils/toast_message.dart';
import '../../../../data/models/bread_counting.dart';
import '../../../../data/models/cash_counting.dart';
import '../../../../data/models/product_not_added.dart';
import '../../../widgets/custom_app_bar_with_date.dart';
import '../../../widgets/custom_confirmation_dialog.dart';
import '../../../widgets/custom_payment_dialog.dart';
import '../../../widgets/empty_content.dart';
import '../../../widgets/error_animation.dart';
import '../../../widgets/loading_indicator.dart';
import '../bloc/bloc/cash_counting_bloc.dart';
import '../bloc/expense/expense_bloc.dart';
import '../bloc/product_counting_not_added/product_counting_not_added_bloc.dart';
import '../bloc/received_money_from_service/received_money_from_service_bloc.dart';
import '../bloc/stale_bread/stale_bread_bloc.dart';
import '../bloc/stale_bread_products/stale_bread_products_bloc.dart';
import '../bloc/stale_product/stale_product_bloc.dart';
import '../bloc/stale_product_products/stale_product_products_bloc.dart';

class SellAssistancePage extends StatefulWidget {
  static const String routeName = "sell-assistance-page";
  final UserModel user;
  const SellAssistancePage({super.key, required this.user});

  @override
  State<SellAssistancePage> createState() => _SellAssistancePageState();
}

class _SellAssistancePageState extends State<SellAssistancePage> {
  static DateTime? selectedDate = DateTime.now();
  static String date = "Bugün";
  static bool todayDate = true;

@override
  void initState() {
    super.initState();
     isAdminCheck(widget.user.token!);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(),
      body: _buildBody(),
    );
  }

  _buildBody() {
    return SingleChildScrollView(
      child: Column(
        children: [
          _expense(),
          _service(),
          _stale(),
          _counting(),
        ],
      ),
    );
  }

  _buildAppbar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(70),
      child: CustomAppBarWithDate(
        title: "Tezgah",
        date: date,
        onTap: _selectDate,
        additionalMenuItems: const [
          PopupMenuItem<String>(
            value: 'purchesed-products',
            child: Text('Dışardan alınan ürünler'),
          ),
        ],
        onMenuItemSelected: (value) {
          if (value == 'purchesed-products') {
            Navigator.pushNamed(context, ProductionPage.routeName,
                arguments: widget.user);
          }
        },
      ),
    );
  }

  _counting() {
    return Container(
      margin: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: GlobalVariables.secondaryColorLight,
      ),
      child: ExpansionTile(
        collapsedIconColor: GlobalVariables.secondaryColor,
        iconColor: GlobalVariables.secondaryColor,
        title: const Text(
          'Sayım',
        ),
        children: [
          CustomSellListTile(
              title: 'Ekmek',
              onShowDetails: () {
                _updateBreadCounting(selectedDate!);
              },
              onAdd: todayDate
                  ? () {
                      _addBreadCountingDialog(selectedDate!);
                    }
                  : null),
          const Divider(
            height: 1,
            color: Colors.white,
            indent: 10,
            endIndent: 10,
          ),
          CustomSellListTile(
              title: 'Pasta',
              onShowDetails: () {
                _showAddedProductCountingList(1);
              },
              onAdd: todayDate
                  ? () {
                      _showProductCountingNotAddedList(1);
                    }
                  : null),
          const Divider(
            height: 1,
            color: Colors.white,
            indent: 10,
            endIndent: 10,
          ),
          CustomSellListTile(
              title: 'Börek',
              onShowDetails: () {
                _showAddedProductCountingList(2);
              },
              onAdd: todayDate
                  ? () {
                      _showProductCountingNotAddedList(2);
                    }
                  : null),
          const Divider(
            height: 1,
            color: Colors.white,
            indent: 10,
            endIndent: 10,
          ),
          CustomSellListTile(
              title: 'Dışardan Alınan',
              onShowDetails: () {
                _showAddedProductCountingList(3);
              },
              onAdd: todayDate
                  ? () {
                      _showProductCountingNotAddedList(3);
                    }
                  : null),
          const Divider(
            height: 1,
            color: Colors.white,
            indent: 10,
            endIndent: 10,
          ),
          // -------NEED TO BE DONE--------
          CustomSellListTile(
              title: 'Kasa',
              onShowDetails: () {
                _updateCashCountingDialog("Kasa Sayımı Güncelleme");
              },
              onAdd: todayDate
                  ? () {
                      _addCashCountingDialog("Kasa Sayımı");
                    }
                  : null),
        ],
      ),
    );
  }

  _stale() {
    return Container(
      margin: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: GlobalVariables.secondaryColorLight,
      ),
      child: ExpansionTile(
        collapsedIconColor: GlobalVariables.secondaryColor,
        iconColor: GlobalVariables.secondaryColor,
        title: const Text(
          'Bayat',
        ),
        children: [
          CustomSellListTile(
              title: 'Ekmek',
              onShowDetails: _showStaleBreadList,
              onAdd: todayDate ? _showStaleBreadProductList : null),
          const Divider(
            height: 1,
            color: Colors.white,
            indent: 10,
            endIndent: 10,
          ),
          CustomSellListTile(
              title: 'Pasta',
              onShowDetails: () {
                _showStaleAddedProductList(1);
              },
              onAdd: todayDate
                  ? () {
                      _showStaleProductList(1);
                    }
                  : null),
          const Divider(
            height: 1,
            color: Colors.white,
            indent: 10,
            endIndent: 10,
          ),
          CustomSellListTile(
              title: 'Börek',
              onShowDetails: () {
                _showStaleAddedProductList(2);
              },
              onAdd: todayDate
                  ? () {
                      _showStaleProductList(2);
                    }
                  : null)
        ],
      ),
    );
  }

  _service() {
    return Container(
      margin: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: GlobalVariables.secondaryColorLight,
      ),
      child: ExpansionTile(
        collapsedIconColor: GlobalVariables.secondaryColor,
        iconColor: GlobalVariables.secondaryColor,
        title: const Text(
          'Service',
        ),
        children: [
          CustomSellListTile(
              title: 'Şoför',
              onShowDetails: () {
                _showGivenProductToServiceList(1);
              },
              onAdd: todayDate ? () => _addGivenProductToService(1) : null),
          const Divider(
            height: 1,
            color: Colors.white,
            indent: 10,
            endIndent: 10,
          ),
          CustomSellListTile(
              title: 'Getir',
              onShowDetails: () => _showGivenProductToServiceList(2),
              onAdd: todayDate ? () => _addGivenProductToService(2) : null),
          const Divider(
            height: 1,
            color: Colors.white,
            indent: 10,
            endIndent: 10,
          ),
          CustomSellListTile(
              title: 'Alınan Bayat',
              onShowDetails: _showServiceStaleProductList,
              onAdd: todayDate ? _addServiceStaleProduct : null),
          const Divider(
            height: 1,
            color: Colors.white,
            indent: 10,
            endIndent: 10,
          ),
          CustomSellListTile(
              title: 'Alınan Para',
              onShowDetails: () {
                _updateReceivedPaymentFromService(1,
                    "Servisten alınan parayı güncellemek için emin misiniz?");
              },
              onAdd: todayDate
                  ? () {
                      _addReceivedPaymentFromServiceDialog(
                          1, "Servisten alınan para");
                    }
                  : null)
        ],
      ),
    );
  }

  _expense() {
    return Container(
        margin: const EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: GlobalVariables.secondaryColorLight,
        ),
        child: CustomSellListTile(
            title: 'Gider',
            onShowDetails: _showExpenseList,
            onAdd: todayDate ? _addExpense : null));
  }

  Future<void> _selectDate() async {
    var newDate = await showDatePicker(
        context: context,
        initialDate: selectedDate!,
        firstDate: DateTime(2023),
        lastDate: DateTime.now());

    if (selectedDate != null && newDate != null && !checkDate(newDate)) {
      selectedDate = newDate;
      setState(() {
        todayDate = isToday(selectedDate!);
        todayDate
            ? date = 'Bugün'
            : date = selectedDate.toString().split(" ")[0];
      });
    }
  }

  bool checkDate(DateTime newDate) {
    return newDate.year == selectedDate!.year &&
        newDate.month == selectedDate!.month &&
        newDate.day == selectedDate!.day;
  }

  _addGivenProductToService(int serviceType) {
    TextEditingController controller = TextEditingController();

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return CustomReceiveAmountDialog(
              title: 'Ekmek Teslimati',
              controller: controller,
              onSave: (amount) {
                context.read<GivenProductToServiceBloc>().add(
                    GivenProductToServicePostRequested(
                        givenProductToService: GivenProductToServiceModel(
                            id: 0,
                            userId: widget.user.id!,
                            quantity: amount,
                            date: DateTime.now(),
                            serviceProductId: 1,
                            serviceTypeId: serviceType)));
              });
        });
  }

  _showGivenProductToServiceList(int serviceType) {
    context.read<GivenProductToServiceBloc>().add(
        GivenProductToServiceGetListRequested(
            date: selectedDate!, servisTypeId: serviceType));
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return BlocBuilder<GivenProductToServiceBloc,
              GivenProductToServiceState>(builder: ((context, state) {
            return switch (state) {
              GivenProductToServiceLoading() => const LoadingIndicator(),
              GivenProductToServiceFailure() => const ErrorAnimation(),
              GivenProductToServiceSuccess() => state
                      .givenProductToServiceList!.isEmpty
                  ? const EmptyContent()
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(8),
                          child: Center(
                            child: Text(
                              "Ekmek Teslimat Listesi",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemCount: state.givenProductToServiceList!.length,
                            itemBuilder: (context, index) {
                              return Material(
                                child: ListTile(
                                  tileColor: index.isOdd
                                      ? GlobalVariables.oddItemColor
                                      : GlobalVariables.evenItemColor,
                                  title: Text(state
                                      .givenProductToServiceList![index]
                                      .quantity
                                      .toString()),
                                  subtitle: Text(getFormattedDateTime(state
                                      .givenProductToServiceList![index].date)),
                                  trailing: todayDate &&
                                          widget.user.id ==
                                              state
                                                  .givenProductToServiceList![
                                                      index]
                                                  .userId
                                      ? Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                              IconButton(
                                                  onPressed: () {
                                                    _updateGivenProductToService(
                                                        state.givenProductToServiceList![
                                                            index]);
                                                  },
                                                  icon: const Icon(Icons.edit),
                                                  color: GlobalVariables
                                                      .secondaryColor),
                                              IconButton(
                                                  onPressed: () {
                                                    _deleteGivenProductToService(
                                                        state.givenProductToServiceList![
                                                            index]);
                                                  },
                                                  icon:
                                                      const Icon(Icons.delete),
                                                  color: GlobalVariables
                                                      .secondaryColor),
                                            ])
                                      : null,
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    )
            };
          }));
        });
  }

  _updateGivenProductToService(
      GivenProductToServiceModel givenProductToServiceModel) {
    TextEditingController controller = TextEditingController(
        text: givenProductToServiceModel.quantity.toString());

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return CustomReceiveAmountDialog(
              title: 'Ekmek Teslimati Güncelleme',
              controller: controller,
              onSave: (amount) {
                if (amount == givenProductToServiceModel.quantity) {
                  return;
                }
                context.read<GivenProductToServiceBloc>().add(
                    GivenProductToServiceUpdateRequested(
                        givenProductToService: GivenProductToServiceModel(
                            id: givenProductToServiceModel.id,
                            userId: givenProductToServiceModel.userId,
                            quantity: amount,
                            date: givenProductToServiceModel.date,
                            serviceProductId:
                                givenProductToServiceModel.serviceProductId,
                            serviceTypeId:
                                givenProductToServiceModel.serviceTypeId)));
              });
        });
  }

  _deleteGivenProductToService(
      GivenProductToServiceModel givenProductToServiceModel) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return CustomConfirmationDialog(
              title: 'Silme',
              content: 'Ekmek teslimati silmek için emin misiniz?',
              onTap: () {
                context.read<GivenProductToServiceBloc>().add(
                    GivenProductToServiceDeleteRequested(
                        givenProductToService: givenProductToServiceModel));
              });
        });
  }

  _showExpenseList() {
    context
        .read<ExpenseBloc>()
        .add(ExpenseGetListRequested(date: selectedDate!));
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return BlocBuilder<ExpenseBloc, ExpenseState>(
              builder: ((context, state) {
            return switch (state) {
              ExpenseLoading() => const LoadingIndicator(),
              ExpenseFailure() => const ErrorAnimation(),
              ExpenseSuccess() => state.expenseList!.isEmpty
                  ? const EmptyContent()
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(8),
                          child: Center(
                            child: Text(
                              "Giderler Listesi",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemCount: state.expenseList!.length,
                            itemBuilder: (context, index) {
                              return Material(
                                child: ListTile(
                                  tileColor: index.isOdd
                                      ? GlobalVariables.oddItemColor
                                      : GlobalVariables.evenItemColor,
                                  title: Text(state.expenseList![index].detail),
                                  subtitle: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(state.expenseList![index].amount
                                          .toString()),
                                      Text(getFormattedDateTime(
                                          state.expenseList![index].date)),
                                    ],
                                  ),
                                  trailing: todayDate &&
                                          widget.user.id ==
                                              state.expenseList![index].userId
                                      ? Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                              IconButton(
                                                  onPressed: () {
                                                    _updateExpense(state
                                                        .expenseList![index]);
                                                  },
                                                  icon: const Icon(Icons.edit),
                                                  color: GlobalVariables
                                                      .secondaryColor),
                                              IconButton(
                                                  onPressed: () {
                                                    _deleteExpense(state
                                                        .expenseList![index]);
                                                  },
                                                  icon:
                                                      const Icon(Icons.delete),
                                                  color: GlobalVariables
                                                      .secondaryColor),
                                            ])
                                      : null,
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    )
            };
          }));
        });
  }

  _deleteExpense(ExpenseModel expense) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return CustomConfirmationDialog(
              title: 'Silme',
              content: '${expense.detail} gideri silmek için emin misiniz?',
              onTap: () {
                context
                    .read<ExpenseBloc>()
                    .add(ExpenseDeleteRequested(expense: expense));
              });
        });
  }

  _updateExpense(ExpenseModel expense) {
    TextEditingController expenseAmountController =
        TextEditingController(text: expense.amount.toString());
    TextEditingController expenseNameController =
        TextEditingController(text: expense.detail);
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return CustomExpenseDialog(
              title: 'Gider Güncelle',
              expenseAmountController: expenseAmountController,
              expenseNameController: expenseNameController,
              onSave: (amount, name) {
                if (amount == expense.amount && name == expense.detail) {
                  return;
                }
                context.read<ExpenseBloc>().add(ExpenseUpdateRequested(
                    expense: ExpenseModel(
                        id: expense.id,
                        detail: name,
                        date: DateTime.now(),
                        amount: amount,
                        userId: expense.userId)));
              });
        });
  }

  _addExpense() {
    TextEditingController expenseAmountController = TextEditingController();
    TextEditingController expenseNameController = TextEditingController();

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return CustomExpenseDialog(
              title: 'Gider Ekle',
              expenseAmountController: expenseAmountController,
              expenseNameController: expenseNameController,
              onSave: (amount, name) {
                context.read<ExpenseBloc>().add(ExpensePostRequested(
                    expense: ExpenseModel(
                        id: 0,
                        detail: name,
                        date: DateTime.now(),
                        amount: amount,
                        userId: widget.user.id!)));
              });
        });
  }

  _showServiceStaleProductList() {
    context.read<ServiceStaleProductBloc>().add(
        ServiceStaleProductGetListRequested(
            date: selectedDate!, serviceTypeId: 1));
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return BlocBuilder<ServiceStaleProductBloc, ServiceStaleProductState>(
              builder: ((context, state) {
            return switch (state) {
              ServiceStaleProductLoading() => const LoadingIndicator(),
              ServiceStaleProductFailure() => const ErrorAnimation(),
              ServiceStaleProductSuccess() => state
                      .serviceStaleProductList!.isEmpty
                  ? const EmptyContent()
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(8),
                          child: Center(
                            child: Text(
                              "Alınan Bayat Listesi",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemCount: state.serviceStaleProductList!.length,
                            itemBuilder: (context, index) {
                              return Material(
                                child: ListTile(
                                  tileColor: index.isOdd
                                      ? GlobalVariables.oddItemColor
                                      : GlobalVariables.evenItemColor,
                                  title: Text(state
                                      .serviceStaleProductList![index].quantity
                                      .toString()),
                                  subtitle: Text(getFormattedDateTime(state
                                      .serviceStaleProductList![index].date)),
                                  trailing: todayDate &&
                                          widget.user.id ==
                                              state
                                                  .serviceStaleProductList![
                                                      index]
                                                  .userId
                                      ? Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                              IconButton(
                                                  onPressed: () {
                                                    _updateServiceStaleProduct(
                                                        state.serviceStaleProductList![
                                                            index]);
                                                  },
                                                  icon: const Icon(Icons.edit),
                                                  color: GlobalVariables
                                                      .secondaryColor),
                                              IconButton(
                                                  onPressed: () {
                                                    _deleteServiceStaleProduct(
                                                        state.serviceStaleProductList![
                                                            index]);
                                                  },
                                                  icon:
                                                      const Icon(Icons.delete),
                                                  color: GlobalVariables
                                                      .secondaryColor),
                                            ])
                                      : null,
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    )
            };
          }));
        });
  }

  _deleteServiceStaleProduct(ServiceStaleProductModel serviceStaleProduct) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return CustomConfirmationDialog(
              title: 'Silme',
              content: 'Alınan bayatı silmek için emin misiniz?',
              onTap: () {
                context.read<ServiceStaleProductBloc>().add(
                    ServiceStaleProductDeleteRequested(
                        serviceStaleProduct: serviceStaleProduct));
              });
        });
  }

  _updateServiceStaleProduct(ServiceStaleProductModel serviceStaleProduct) {
    TextEditingController controller =
        TextEditingController(text: serviceStaleProduct.quantity.toString());

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return CustomReceiveAmountDialog(
              title: 'Ekmek Teslimati Güncelleme',
              controller: controller,
              onSave: (amount) {
                if (amount == serviceStaleProduct.quantity) {
                  return;
                }
                context.read<ServiceStaleProductBloc>().add(
                    ServiceStaleProductUpdateRequested(
                        serviceStaleProduct: ServiceStaleProductModel(
                            id: serviceStaleProduct.id,
                            userId: serviceStaleProduct.userId,
                            quantity: amount,
                            date: serviceStaleProduct.date,
                            serviceProductId:
                                serviceStaleProduct.serviceProductId,
                            serviceTypeId: serviceStaleProduct.serviceTypeId)));
              });
        });
  }

  _addServiceStaleProduct() {
    TextEditingController controller = TextEditingController();
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return CustomReceiveAmountDialog(
              title: 'Teslim Alınan Bayat',
              controller: controller,
              onSave: (amount) {
                context.read<ServiceStaleProductBloc>().add(
                      ServiceStaleProductPostRequested(
                        serviceStaleProduct: ServiceStaleProductModel(
                            id: 0,
                            userId: widget.user.id!,
                            quantity: amount,
                            date: DateTime.now(),
                            serviceProductId: 1,
                            serviceTypeId: 1),
                      ),
                    );
              });
        });
  }

  _showStaleBreadList() {
    context
        .read<StaleBreadBloc>()
        .add(GetStaleBreadRequested(date: selectedDate!));
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return BlocBuilder<StaleBreadBloc, StaleBreadState>(
              builder: ((context, state) {
            return switch (state) {
              StaleBreadLoading() => const LoadingIndicator(),
              StaleBreadFailure() => const ErrorAnimation(),
              StaleBreadSuccess() => state.staleBreadList!.isEmpty
                  ? const EmptyContent()
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(8),
                          child: Center(
                            child: Text(
                              "Bayat Ekmek Listesi",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemCount: state.staleBreadList!.length,
                            itemBuilder: (context, index) {
                              return Material(
                                child: ListTile(
                                  tileColor: index.isOdd
                                      ? GlobalVariables.oddItemColor
                                      : GlobalVariables.evenItemColor,
                                  title: Text(state.staleBreadList![index]
                                      .doughFactoryProductName),
                                  subtitle: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(state.staleBreadList![index].quantity
                                          .toString()),
                                      Text(getFormattedDateTime(
                                          state.staleBreadList![index].date)),
                                    ],
                                  ),
                                  trailing: todayDate
                                      ? Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                              IconButton(
                                                  onPressed: () {
                                                    _updateStaleBreadAdded(
                                                        state.staleBreadList![
                                                            index]);
                                                  },
                                                  icon: const Icon(Icons.edit),
                                                  color: GlobalVariables
                                                      .secondaryColor),
                                              IconButton(
                                                  onPressed: () {
                                                    _deleteStaleBreadAdded(
                                                        state.staleBreadList![
                                                            index]);
                                                  },
                                                  icon:
                                                      const Icon(Icons.delete),
                                                  color: GlobalVariables
                                                      .secondaryColor),
                                            ])
                                      : null,
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    )
            };
          }));
        });
  }

  _deleteStaleBreadAdded(StaleBreadAddedModel staleBreadAdded) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return CustomConfirmationDialog(
              title: 'Silme',
              content:
                  '${staleBreadAdded.doughFactoryProductName} bayatı silmek için emin misiniz?',
              onTap: () {
                context.read<StaleBreadBloc>().add(RemoveStaleBreadRequested(
                    staleBreadAddedModel: staleBreadAdded));
              });
        });
  }

  _updateStaleBreadAdded(StaleBreadAddedModel staleBreadAdded) {
    TextEditingController controller =
        TextEditingController(text: staleBreadAdded.quantity.toString());

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return CustomReceiveAmountDialog(
              title:
                  '${staleBreadAdded.doughFactoryProductName} Bayatı Güncelleme',
              controller: controller,
              onSave: (amount) {
                if (amount == staleBreadAdded.quantity) {
                  return;
                }
                context.read<StaleBreadBloc>().add(UpdateStaleBreadRequested(
                        staleBreadAddedModel: StaleBreadAddedModel(
                      id: staleBreadAdded.id,
                      doughFactoryProductId:
                          staleBreadAdded.doughFactoryProductId,
                      quantity: amount,
                      date: staleBreadAdded.date,
                      doughFactoryProductName:
                          staleBreadAdded.doughFactoryProductName,
                    )));
              });
        });
  }

  _showStaleBreadProductList() {
    context
        .read<StaleBreadProductsBloc>()
        .add(GetStaleBreadProductsRequested(date: selectedDate!));
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return BlocBuilder<StaleBreadProductsBloc, StaleBreadProductsState>(
              builder: ((context, state) {
            return switch (state) {
              StaleBreadProductsLoading() => const LoadingIndicator(),
              StaleBreadProductsFailure() => const ErrorAnimation(),
              StaleBreadProductsSuccess() => state
                      .staleBreadProductsList!.isEmpty
                  ? const EmptyContent()
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(8),
                          child: Center(
                            child: Text(
                              "Ekmek Ürünleri Listesi",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemCount: state.staleBreadProductsList!.length,
                            itemBuilder: (context, index) {
                              return Material(
                                child: ListTile(
                                  tileColor: index.isOdd
                                      ? GlobalVariables.oddItemColor
                                      : GlobalVariables.evenItemColor,
                                  title: Text(state
                                      .staleBreadProductsList![index].name),
                                  trailing: todayDate
                                      ? IconButton(
                                          onPressed: () {
                                            _addStaleBreadProduct(
                                                state.staleBreadProductsList![
                                                    index]);
                                          },
                                          icon: const Icon(Icons.add),
                                          color: GlobalVariables.secondaryColor)
                                      : null,
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    )
            };
          }));
        });
  }

  _addStaleBreadProduct(StaleBreadModel staleBread) {
    TextEditingController controller = TextEditingController();
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return CustomReceiveAmountDialog(
              title: 'Bayat ${staleBread.name}',
              controller: controller,
              onSave: (amount) {
                context.read<StaleBreadProductsBloc>().add(
                      PostStaleBreadProductsRequested(
                          staleBreadModel: staleBread, staleQuantity: amount),
                    );
              });
        });
  }

  _showStaleAddedProductList(int categoryId) {
    context.read<StaleProductBloc>().add(GetStaleAddedProductRequested(
        date: selectedDate!, categoryId: categoryId));
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return BlocBuilder<StaleProductBloc, StaleProductState>(
              builder: ((context, state) {
            return switch (state) {
              StaleAddedProductLoading() => const LoadingIndicator(),
              StaleAddedProductFailure() => const ErrorAnimation(),
              StaleAddedProductSuccess() => state.staleAddedProductList!.isEmpty
                  ? const EmptyContent()
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(8),
                          child: Center(
                            child: Text(
                              "Bayat Ürünler Listesi",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemCount: state.staleAddedProductList!.length,
                            itemBuilder: (context, index) {
                              return Material(
                                child: ListTile(
                                  tileColor: index.isOdd
                                      ? GlobalVariables.oddItemColor
                                      : GlobalVariables.evenItemColor,
                                  title: Text(state
                                      .staleAddedProductList![index]
                                      .productName),
                                  subtitle: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(state.staleAddedProductList![index]
                                          .quantity
                                          .toString()),
                                      Text(getFormattedDateTime(state
                                          .staleAddedProductList![index].date)),
                                    ],
                                  ),
                                  trailing: todayDate
                                      ? Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                              IconButton(
                                                  onPressed: () {
                                                    _updateStaleProductAdded(
                                                        state.staleAddedProductList![
                                                            index]);
                                                  },
                                                  icon: const Icon(Icons.edit),
                                                  color: GlobalVariables
                                                      .secondaryColor),
                                              IconButton(
                                                  onPressed: () {
                                                    _deleteStaleProductAdded(
                                                        state.staleAddedProductList![
                                                            index]);
                                                  },
                                                  icon:
                                                      const Icon(Icons.delete),
                                                  color: GlobalVariables
                                                      .secondaryColor),
                                            ])
                                      : null,
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    )
            };
          }));
        });
  }

  _deleteStaleProductAdded(StaleProductAddedModel staleProductAdded) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return CustomConfirmationDialog(
              title: 'Silme',
              content:
                  '${staleProductAdded.productName} bayatı silmek için emin misiniz?',
              onTap: () {
                context.read<StaleProductBloc>().add(
                    RemoveStaleAddedProductRequested(
                        staleProductAddedModel: staleProductAdded));
              });
        });
  }

  _updateStaleProductAdded(StaleProductAddedModel staleProductAdded) {
    TextEditingController controller =
        TextEditingController(text: staleProductAdded.quantity.toString());

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return CustomReceiveAmountDialog(
              title: '${staleProductAdded.productName} Bayatı Güncelleme',
              controller: controller,
              onSave: (amount) {
                if (amount == staleProductAdded.quantity) {
                  return;
                }
                context
                    .read<StaleProductBloc>()
                    .add(UpdateStaleAddedProductRequested(
                        staleProductAddedModel: StaleProductAddedModel(
                      id: staleProductAdded.id,
                      productName: staleProductAdded.productName,
                      quantity: amount,
                      date: staleProductAdded.date,
                      productId: staleProductAdded.productId,
                    )));
              });
        });
  }

  _showStaleProductList(int categoryId) {
    context.read<StaleProductProductsBloc>().add(
        GetStaleProductsRequested(date: selectedDate!, categoryId: categoryId));
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return BlocBuilder<StaleProductProductsBloc,
              StaleProductProductsState>(builder: ((context, state) {
            return switch (state) {
              StaleProductsLoading() => const LoadingIndicator(),
              StaleProductsFailure() => const ErrorAnimation(),
              StaleProductsSuccess() => state.staleProductsList!.isEmpty
                  ? const EmptyContent()
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(8),
                          child: Center(
                            child: Text(
                              "Ürünler Listesi",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemCount: state.staleProductsList!.length,
                            itemBuilder: (context, index) {
                              return Material(
                                child: ListTile(
                                  tileColor: index.isOdd
                                      ? GlobalVariables.oddItemColor
                                      : GlobalVariables.evenItemColor,
                                  title: Text(
                                      state.staleProductsList![index].name!),
                                  trailing: todayDate
                                      ? IconButton(
                                          onPressed: () {
                                            _addStaleProduct(state
                                                .staleProductsList![index]);
                                          },
                                          icon: const Icon(Icons.add),
                                          color: GlobalVariables.secondaryColor)
                                      : null,
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    )
            };
          }));
        });
  }

  _addStaleProduct(ProductNotAddedModel staleBread) {
    TextEditingController controller = TextEditingController();
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return CustomReceiveAmountDialog(
              title: 'Bayat ${staleBread.name}',
              controller: controller,
              onSave: (amount) {
                context.read<StaleProductProductsBloc>().add(
                      PostStaleProductsRequested(
                          staleBreadModel: staleBread, staleQuantity: amount),
                    );
              });
        });
  }

  _addReceivedPaymentFromServiceDialog(int serviceTypeId, String title) {
    context.read<ReceivedMoneyFromServiceBloc>().add(
        ReceivedMoneyFromServiceGetListRequested(
            date: selectedDate!, servisTypeId: serviceTypeId));
    TextEditingController controller = TextEditingController();
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return BlocBuilder<ReceivedMoneyFromServiceBloc,
              ReceivedMoneyFromServiceState>(builder: ((context, state) {
            return switch (state) {
              ReceivedMoneyFromServiceLoading() => const LoadingIndicator(),
              ReceivedMoneyFromServiceFailure() => const ErrorAnimation(),
              ReceivedMoneyFromServiceSuccess() =>
                state.receivedMoneyFromService != null
                    ? CustomConfirmationDialog(
                        title: "Uyarı",
                        onTap: () {},
                        content: "Servisten para teslim alınmış")
                    : CustomPaymentDialog(
                        title: title,
                        controller: controller,
                        onSave: (paidAmount) {
                          if (paidAmount < 1) {
                            showToastMessage("Geçerli bir tutar girilmeli!");
                            return;
                          }
                          context.read<ReceivedMoneyFromServiceBloc>().add(
                              ReceivedMoneyFromServicePostRequested(
                                  receivedMoneyFromService:
                                      ReceivedMoneyFromServiceModel(
                                          id: 0,
                                          userId: widget.user.id!,
                                          amount: paidAmount,
                                          serviceTypeId: serviceTypeId,
                                          date: selectedDate!)));
                        })
            };
          }));
        });
  }

  _updateReceivedPaymentFromService(int serviceTypeId, String title) {
    context.read<ReceivedMoneyFromServiceBloc>().add(
        ReceivedMoneyFromServiceGetListRequested(
            date: selectedDate!, servisTypeId: serviceTypeId));
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return BlocBuilder<ReceivedMoneyFromServiceBloc,
              ReceivedMoneyFromServiceState>(builder: ((context, state) {
            return switch (state) {
              ReceivedMoneyFromServiceLoading() => const LoadingIndicator(),
              ReceivedMoneyFromServiceFailure() => const ErrorAnimation(),
              ReceivedMoneyFromServiceSuccess() => state
                          .receivedMoneyFromService ==
                      null
                  ? CustomConfirmationDialog(
                      title: "Uyarı",
                      onTap: () {},
                      content: "Para teslimatı daha yapılmadı")
                  : CustomPaymentDialog(
                      title: "Güncelleme",
                      firstText: title,
                      controller: TextEditingController(
                          text: state.receivedMoneyFromService!.amount
                              .toString()),
                      onSave: (paidAmount) {
                        if (paidAmount < 1) {
                          showToastMessage("Geçerli bir tutar girilmeli!");
                          return;
                        }
                        if (paidAmount ==
                            state.receivedMoneyFromService!.amount) {
                          return;
                        }
                        context.read<ReceivedMoneyFromServiceBloc>().add(
                            ReceivedMoneyFromServiceUpdateRequested(
                                receivedMoneyFromService:
                                    ReceivedMoneyFromServiceModel(
                                        id: state.receivedMoneyFromService!.id,
                                        userId: state
                                            .receivedMoneyFromService!.userId,
                                        amount: paidAmount,
                                        serviceTypeId: state
                                            .receivedMoneyFromService!
                                            .serviceTypeId,
                                        date: state
                                            .receivedMoneyFromService!.date)));
                      })
            };
          }));
        });
  }

  _addBreadCountingDialog(DateTime date) {
    context
        .read<BreadCountingBloc>()
        .add(BreadCountingGetListRequested(date: date));
    TextEditingController controller = TextEditingController();
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return BlocBuilder<BreadCountingBloc, BreadCountingState>(
              builder: ((context, state) {
            return switch (state) {
              BreadCountingLoading() => const LoadingIndicator(),
              BreadCountingFailure() => const ErrorAnimation(),
              BreadCountingSuccess() => state.breadCounting != null
                  ? CustomConfirmationDialog(
                      title: "Uyarı",
                      onTap: () {},
                      content: "Ekmek sayımı yapılmış")
                  : CustomReceiveAmountDialog(
                      title: 'Toplam ekmek sayımı ',
                      controller: controller,
                      onSave: (enteredQuantity) {
                        if (enteredQuantity < 1) {
                          showToastMessage("Geçerli bir tutar girilmeli!");
                          return;
                        }
                        context.read<BreadCountingBloc>().add(
                            BreadCountingPostRequested(
                                breadCounting: BreadCountingModel(
                                    id: 0,
                                    userId: widget.user.id!,
                                    quantity: enteredQuantity,
                                    date: selectedDate!)));
                      })
            };
          }));
        });
  }

  _updateBreadCounting(DateTime date) {
    context
        .read<BreadCountingBloc>()
        .add(BreadCountingGetListRequested(date: date));
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return BlocBuilder<BreadCountingBloc, BreadCountingState>(
              builder: ((context, state) {
            return switch (state) {
              BreadCountingLoading() => const LoadingIndicator(),
              BreadCountingFailure() => const ErrorAnimation(),
              BreadCountingSuccess() => state.breadCounting == null
                  ? CustomConfirmationDialog(
                      title: "Uyarı",
                      onTap: () {},
                      content: "Ekmek sayımı daha yapılmadı")
                  : CustomReceiveAmountDialog(
                      title: 'Ekmek sayımı güncelleme',
                      controller: TextEditingController(
                          text: state.breadCounting!.quantity.toString()),
                      onSave: (enteredQuantity) {
                        if (enteredQuantity < 1) {
                          showToastMessage("Geçerli bir tutar girilmeli!");
                          return;
                        }
                        if (enteredQuantity == state.breadCounting!.quantity) {
                          return;
                        }
                        context.read<BreadCountingBloc>().add(
                            BreadCountingUpdateRequested(
                                breadCounting: BreadCountingModel(
                                    id: state.breadCounting!.id,
                                    userId: state.breadCounting!.userId,
                                    quantity: enteredQuantity,
                                    date: state.breadCounting!.date)));
                      })
            };
          }));
        });
  }

  _showProductCountingNotAddedList(int categoryId) {
    context.read<ProductCountingNotAddedBloc>().add(
        GetProductCountingNotAddedRequested(
            date: selectedDate!, categoryId: categoryId));
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return BlocBuilder<ProductCountingNotAddedBloc,
              ProductCountingNotAddedState>(builder: ((context, state) {
            return switch (state) {
              ProductCountingNotAddedLoading() => const LoadingIndicator(),
              ProductCountingNotAddedFailure() => const ErrorAnimation(),
              ProductCountingNotAddedSuccess() => state
                      .productNotAddedList!.isEmpty
                  ? const EmptyContent()
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(8),
                          child: Center(
                            child: Text(
                              "Ürünler Listesi",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemCount: state.productNotAddedList!.length,
                            itemBuilder: (context, index) {
                              return Material(
                                child: ListTile(
                                  tileColor: index.isOdd
                                      ? GlobalVariables.oddItemColor
                                      : GlobalVariables.evenItemColor,
                                  title: Text(
                                      state.productNotAddedList![index].name!),
                                  trailing: todayDate
                                      ? IconButton(
                                          onPressed: () {
                                            _addProductCounting(state
                                                .productNotAddedList![index]);
                                          },
                                          icon: const Icon(Icons.add),
                                          color: GlobalVariables.secondaryColor)
                                      : null,
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    )
            };
          }));
        });
  }

  _addProductCounting(ProductNotAddedModel product) {
    TextEditingController controller = TextEditingController();
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return CustomReceiveAmountDialog(
              title: '${product.name}',
              controller: controller,
              onSave: (quantity) {
                context.read<ProductCountingNotAddedBloc>().add(
                      PostProductCountingNotAddedRequested(
                          productNotAdded: product, productQuantity: quantity),
                    );
              });
        });
  }

  _showAddedProductCountingList(int categoryId) {
    context.read<ProductCountingAddedBloc>().add(
        GetProductCountingAddedRequested(
            date: selectedDate!, categoryId: categoryId));
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return BlocBuilder<ProductCountingAddedBloc,
              ProductCountingAddedState>(builder: ((context, state) {
            return switch (state) {
              ProductCountingAddedLoading() => const LoadingIndicator(),
              ProductCountingAddedFailure() => const ErrorAnimation(),
              ProductCountingAddedSuccess() => state
                      .productCountingAddedList!.isEmpty
                  ? const EmptyContent()
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(8),
                          child: Center(
                            child: Text(
                              "Ürünler Sayımı Listesi",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemCount: state.productCountingAddedList!.length,
                            itemBuilder: (context, index) {
                              return Material(
                                child: ListTile(
                                  tileColor: index.isOdd
                                      ? GlobalVariables.oddItemColor
                                      : GlobalVariables.evenItemColor,
                                  title: Text(state
                                      .productCountingAddedList![index]
                                      .productName),
                                  subtitle: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(state
                                          .productCountingAddedList![index]
                                          .quantity
                                          .toString()),
                                      Text(getFormattedDateTime(state
                                          .productCountingAddedList![index]
                                          .date)),
                                    ],
                                  ),
                                  trailing: todayDate
                                      ? Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                              IconButton(
                                                  onPressed: () {
                                                    _updateProductCountingAdded(
                                                        state.productCountingAddedList![
                                                            index]);
                                                  },
                                                  icon: const Icon(Icons.edit),
                                                  color: GlobalVariables
                                                      .secondaryColor),
                                              IconButton(
                                                  onPressed: () {
                                                    _deleteProductCountingAdded(
                                                        state.productCountingAddedList![
                                                            index]);
                                                  },
                                                  icon:
                                                      const Icon(Icons.delete),
                                                  color: GlobalVariables
                                                      .secondaryColor),
                                            ])
                                      : null,
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    )
            };
          }));
        });
  }

  _deleteProductCountingAdded(ProductCountingAddedModel productCountingAdded) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return CustomConfirmationDialog(
              title: 'Silme',
              content:
                  '${productCountingAdded.productName} ürün sayımı silmek için emin misiniz?',
              onTap: () {
                context.read<ProductCountingAddedBloc>().add(
                    RemoveProductCountingAddedRequested(
                        productCountingAddedModel: productCountingAdded));
              });
        });
  }

  _updateProductCountingAdded(ProductCountingAddedModel productCountingAdded) {
    TextEditingController controller =
        TextEditingController(text: productCountingAdded.quantity.toString());

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return CustomReceiveAmountDialog(
              title: '${productCountingAdded.productName} Bayatı Güncelleme',
              controller: controller,
              onSave: (amount) {
                if (amount == productCountingAdded.quantity) {
                  return;
                }
                context
                    .read<ProductCountingAddedBloc>()
                    .add(UpdateProductCountingAddedRequested(
                      productCountingAddedModel: ProductCountingAddedModel(
                          id: productCountingAdded.id,
                          productName: productCountingAdded.productName,
                          quantity: amount,
                          productId: productCountingAdded.productId,
                          date: productCountingAdded.date),
                    ));
              });
        });
  }

  _addCashCountingDialog(String title) {
    context
        .read<CashCountingBloc>()
        .add(CashCountingGetListRequested(date: selectedDate!));

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return BlocBuilder<CashCountingBloc, CashCountingState>(
              builder: ((context, state) {
            return switch (state) {
              CashCountingLoading() => const LoadingIndicator(),
              CashCountingFailure() => const ErrorAnimation(),
              CashCountingSuccess() => state.cashCounting != null
                  ? CustomConfirmationDialog(
                      title: "Uyarı",
                      onTap: () {},
                      content: "Kasa sayımı yapılmış!")
                  : CustomCashCountingDialog(
                      title: title,
                      totalController: TextEditingController(),
                      creditcartController: TextEditingController(),
                      reminedController: TextEditingController(),
                      onSave: (totalCash, reminedCash, creditcard) {
                        context.read<CashCountingBloc>().add(
                            CashCountingPostRequested(
                                cashCounting: CashCountingModel(
                                    id: 0,
                                    creditCard: creditcard,
                                    totalMoney: totalCash,
                                    remainedMoney: reminedCash,
                                    date: selectedDate!)));
                      })
            };
          }));
        });
  }

  _updateCashCountingDialog(String title) {
    context
        .read<CashCountingBloc>()
        .add(CashCountingGetListRequested(date: selectedDate!));

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return BlocBuilder<CashCountingBloc, CashCountingState>(
              builder: ((context, state) {
            return switch (state) {
              CashCountingLoading() => const LoadingIndicator(),
              CashCountingFailure() => const ErrorAnimation(),
              CashCountingSuccess() => state.cashCounting == null
                  ? CustomConfirmationDialog(
                      title: "Uyarı",
                      onTap: () {},
                      content: "Kasa sayımı daha yapılmadı!")
                  : CustomCashCountingDialog(
                      title: title,
                      totalController: TextEditingController(
                          text: state.cashCounting!.totalMoney.toString()),
                      creditcartController: TextEditingController(
                          text: state.cashCounting!.creditCard.toString()),
                      reminedController: TextEditingController(
                          text: state.cashCounting!.remainedMoney.toString()),
                      onSave: (totalCash, reminedCash, creditcard) {
                        if (totalCash == state.cashCounting!.totalMoney &&
                            state.cashCounting!.remainedMoney == reminedCash &&
                            creditcard == state.cashCounting!.creditCard) {
                          return;
                        }
                        context.read<CashCountingBloc>().add(
                            CashCountingUpdateRequested(
                                cashCounting: CashCountingModel(
                                    id: state.cashCounting!.id,
                                    creditCard: creditcard,
                                    totalMoney: totalCash,
                                    remainedMoney: reminedCash,
                                    date: state.cashCounting!.date)));
                      })
            };
          }));
        });
  }
}
