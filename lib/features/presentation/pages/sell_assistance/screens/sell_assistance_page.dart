import 'package:bakery_app/core/utils/toast_message.dart';
import 'package:bakery_app/features/data/models/expense.dart';
import 'package:bakery_app/features/presentation/pages/sell_assistance/bloc/expense_bloc.dart';
import 'package:bakery_app/features/presentation/widgets/custom_expense_dialog.dart';
import 'package:bakery_app/features/presentation/widgets/custom_sell_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/constants/global_variables.dart';
import '../../../../../core/utils/is_today_check.dart';
import '../../../widgets/custom_app_bar_with_date.dart';
import '../../../widgets/custom_confirmation_dialog.dart';
import '../../../widgets/empty_content.dart';
import '../../../widgets/error_animation.dart';
import '../../../widgets/loading_indicator.dart';

class SellAssistancePage extends StatefulWidget {
  static const String routeName = "sell-assistance-page";
  const SellAssistancePage({super.key});

  @override
  State<SellAssistancePage> createState() => _SellAssistancePageState();
}

class _SellAssistancePageState extends State<SellAssistancePage> {
  static DateTime? selectedDate = DateTime.now();
  static String date = "Bugün";
  static bool todayDate = true;
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
        children: [_expense(), _service(), _stale(), _counting()],
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
              onShowDetails: _showExpenseList,
              onAdd: todayDate ? _addExpense : null),
          const Divider(
            height: 1,
            color: Colors.white,
            indent: 10,
            endIndent: 10,
          ),
          CustomSellListTile(
              title: 'Pasta',
              onShowDetails: _showExpenseList,
              onAdd: todayDate ? _addExpense : null),
          const Divider(
            height: 1,
            color: Colors.white,
            indent: 10,
            endIndent: 10,
          ),
          CustomSellListTile(
              title: 'Börek',
              onShowDetails: _showExpenseList,
              onAdd: todayDate ? _addExpense : null),
          const Divider(
            height: 1,
            color: Colors.white,
            indent: 10,
            endIndent: 10,
          ),
          CustomSellListTile(
              title: 'Dışardan Alınan',
              onShowDetails: _showExpenseList,
              onAdd: todayDate ? _addExpense : null)
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
              onShowDetails: _showExpenseList,
              onAdd: todayDate ? _addExpense : null),
          const Divider(
            height: 1,
            color: Colors.white,
            indent: 10,
            endIndent: 10,
          ),
          CustomSellListTile(
              title: 'Pasta',
              onShowDetails: _showExpenseList,
              onAdd: todayDate ? _addExpense : null),
          const Divider(
            height: 1,
            color: Colors.white,
            indent: 10,
            endIndent: 10,
          ),
          CustomSellListTile(
              title: 'Börek',
              onShowDetails: _showExpenseList,
              onAdd: todayDate ? _addExpense : null)
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
              onShowDetails: _showExpenseList,
              onAdd: todayDate ? _addExpense : null),
          const Divider(
            height: 1,
            color: Colors.white,
            indent: 10,
            endIndent: 10,
          ),
          CustomSellListTile(
              title: 'Getir',
              onShowDetails: _showExpenseList,
              onAdd: todayDate ? _addExpense : null),
          const Divider(
            height: 1,
            color: Colors.white,
            indent: 10,
            endIndent: 10,
          ),
          CustomSellListTile(
              title: 'Alınan Bayat',
              onShowDetails: _showExpenseList,
              onAdd: todayDate ? _addExpense : null)
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

  _buildAppbar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(70),
      child: CustomAppBarWithDate(
        title: "Tezgah",
        date: date,
        onTap: _selectDate,
      ),
    );
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

  void _showExpenseList() {
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
                                  subtitle: todayDate
                                      ? Text(state.expenseList![index].amount
                                          .toString())
                                      : null,
                                  trailing: todayDate
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

  void _deleteExpense(ExpenseModel expense){
    showDialog(context: context,  builder: (BuildContext context) {
          return CustomConfirmationDialog(
              title: 'Silme',
              content:
                  '${expense.detail} gideri silmek için emin misiniz?',
              onTap: () {
                context.read<ExpenseBloc>().add(ExpenseDeleteRequested(expense: expense));
              });
        });
  }


  void _updateExpense(ExpenseModel expense) {
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
                        amount: amount)));
              });
        });
  }

  void _addExpense() {
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
                        amount: amount)));
              });
        });
  }
}
