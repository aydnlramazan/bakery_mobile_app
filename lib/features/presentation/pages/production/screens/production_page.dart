import 'package:bakery_app/features/presentation/widgets/custom_app_bar_with_date.dart';
import 'package:flutter/material.dart';
class ProductionPage extends StatefulWidget {
   static const String routeName = "production-page";
  const ProductionPage({super.key});

  @override
  State<ProductionPage> createState() => _ProductionPageState();
}

class _ProductionPageState extends State<ProductionPage> {
    static String date = "Bugün";
  static bool todayDate = true;
  static DateTime? selectedDate = DateTime.now();
    @override
  void initState() {
    super.initState();
    //context.read<DoughFactoryBloc>().add(DoughGetListsRequested(dateTime: selectedDate!));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(),
    );
  }

    _buildAppbar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(70),
      child: CustomAppBarWithDate(
        title: "Hamurhane",
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
    if (newDate != null && !checkDate(newDate)) selectedDate = newDate;

    if (selectedDate != null) {
      setState(() {
      //  context.read<DoughFactoryBloc>().add(DoughGetListsRequested(dateTime: selectedDate!));
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

}