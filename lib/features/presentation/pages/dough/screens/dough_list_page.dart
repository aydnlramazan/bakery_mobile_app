// ignore_for_file: use_build_context_synchronously

import 'package:bakery_app/core/constants/constants.dart';
import 'package:bakery_app/core/constants/global_variables.dart';
import 'package:bakery_app/features/data/data_sources/local/shared_preference.dart';
import 'package:bakery_app/features/presentation/pages/dough/screens/dough_product_page.dart';
import 'package:bakery_app/features/presentation/widgets/custom_app_bar_with_date.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../bloc/dough_lists/dough_factory_bloc.dart';

class DoughListPage extends StatefulWidget {
  static const String routeName = "dough-list-page";

  const DoughListPage({super.key});

  @override
  State<DoughListPage> createState() => _DoughListPageState();
}

class _DoughListPageState extends State<DoughListPage> {
  static String date = "Bugün";
  static bool todayDate = true;
  static DateTime? selectedDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    context.read<DoughFactoryBloc>()
        .add(DoughGetListsRequested(dateTime: selectedDate!));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _buildAppbar(),
        floatingActionButton: _buildFloatingButton(),
        body: _buildBody());
  }

  _buildBody() {
    return BlocBuilder<DoughFactoryBloc, DoughFactoryState>(
        builder: (context, state) {
      print("state list page: ${state.doughLists}");
      if (state is DoughFactoryLoading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      if (state.doughLists != null && state.doughLists!.isNotEmpty) {
        return ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: state.doughLists!.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: GlobalVariables.secondaryColorLight,
                  ),
                  child: ListTile(
                    leading: Text(
                      (index + 1).toString(),
                      style: const TextStyle(
                          fontSize: 18, color: GlobalVariables.secondaryColor),
                    ),
                    title: Text(
                      state.doughLists![index].userName!,
                      textScaleFactor: 1.2,
                    ),
                    subtitle: Text(
                      getFormattedDateTime(state.doughLists![index].date!),
                    ),
                    onTap: () async {
                      bool result =
                          await canEdit(state.doughLists![index].userId!);
                      Navigator.pushNamed(context, DoughProductPage.routeName,
                          arguments: {
                            0: state.doughLists![index].id,
                            1: result
                          });
                    },
                  ),
                ),
              );
            });
      }
      return Center(
        child: Container(
          child: Lottie.asset('assets/empty_box.json',
              repeat: false, animate: true),
        ),
      );
    });
  }

  _buildFloatingButton() {
    if (todayDate) {
      return FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, DoughProductPage.routeName,
              arguments: {0: 0, 1: true});
        },
        backgroundColor: GlobalVariables.secondaryColor,
        tooltip: 'Add Dough List',
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      );
    }
    return null;
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
        context
            .read<DoughFactoryBloc>()
            .add(DoughGetListsRequested(dateTime: selectedDate!));
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

  Future<bool> canEdit(int userId) async {
    var user = await UserPreferences.getUser();
    return user!.id == userId && isToday(selectedDate!);
  }
}
