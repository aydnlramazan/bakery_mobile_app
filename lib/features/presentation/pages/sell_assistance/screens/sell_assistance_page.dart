import 'package:bakery_app/features/presentation/widgets/custom_sell_list_tile.dart';
import 'package:flutter/material.dart';

import '../../../../../core/constants/global_variables.dart';
import '../../../widgets/custom_app_bar_with_date.dart';

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
        children: [
          _expense(),
          _service(),
          _stale(),
        _counting()
        ],
      ),
    );
  }

_counting(){
  return Container(
      margin: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: GlobalVariables.secondaryColorLight,
      ),
      child: ExpansionTile(
        collapsedIconColor: GlobalVariables.secondaryColor,
        iconColor: GlobalVariables.secondaryColor,
        title: const Text('Sayım',),
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

  _stale(){
    return Container(
      margin: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: GlobalVariables.secondaryColorLight,
      ),
      child: ExpansionTile(
        collapsedIconColor: GlobalVariables.secondaryColor,
        iconColor: GlobalVariables.secondaryColor,
        title: const Text('Bayat',),
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
        title: const Text('Service',),
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

  bool isToday(DateTime selectedDate) {
    DateTime currentDate = DateTime.now();
    return currentDate.year == selectedDate.year &&
        currentDate.month == selectedDate.month &&
        currentDate.day == selectedDate.day;
  }

  bool checkDate(DateTime newDate) {
    return newDate.year == selectedDate!.year &&
        newDate.month == selectedDate!.month &&
        newDate.day == selectedDate!.day;
  }

  void _showExpenseList() {}

  void _addExpense() {}
}
