// ignore_for_file: use_build_context_synchronously
import 'package:bakery_app/features/presentation/pages/service/screens/service_account_page.dart';
import 'package:bakery_app/features/presentation/pages/service/screens/service_markets_page.dart';
import 'package:bakery_app/features/presentation/widgets/empty_content.dart';
import 'package:bakery_app/features/presentation/widgets/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../../core/constants/global_variables.dart';
import '../../../../data/data_sources/local/shared_preference.dart';
import '../../../widgets/custom_app_bar_with_date.dart';
import '../bloc/service_lists/service_lists_bloc.dart';

class ServiceListPage extends StatefulWidget {
  static const String routeName = "service-list-page";

  const ServiceListPage({super.key});

  @override
  State<ServiceListPage> createState() => _ServiceListPageState();
}

class _ServiceListPageState extends State<ServiceListPage> {
  static DateTime? selectedDate = DateTime.now();
  static String date = "Bugün";
  static bool todayDate = true;
  @override
  void initState() {
    super.initState();
    context
        .read<ServiceListsBloc>()
        .add(ServiceGetListsRequested(dateTime: selectedDate!));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(),
      floatingActionButton: _buildFlaotingButtons(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: _buildBody(),
    );
  }

  _buildBody() {
    return BlocBuilder<ServiceListsBloc, ServiceListsState>(
        builder: (context, state) {
      print("state: ${state.serviceLists}");
      if (state is ServiceListsLoading) {
        return const LoadingIndicator();
      }
      if(state is ServiceListsSuccess){
      if (state.serviceLists != null && state.serviceLists!.isNotEmpty) {
       return ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: state.serviceLists!.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: GlobalVariables.secondaryColorLight,
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      child: Text(
                        (index + 1).toString(),
                        style: const TextStyle(
                            fontSize: 18, color: GlobalVariables.secondaryColor),
                      ),
                    ),
                    title: const Text(
                      "Servis",
                      textScaleFactor: 1.2,
                    ),
                    subtitle: Text(
                      getFormattedDateTime(state.serviceLists![index].date!),
                    ),
                    onTap: () async {
                      bool result =
                          await canEdit(state.serviceLists![index].userId!);
                      Navigator.pushNamed(context, ServiceMarketsPage.routeName,
                          arguments: {
                            0: state.serviceLists![index].id,
                            1: result
                          });
                    },
                  ),
                ),
              );
            });
      }
           }
      return const EmptyContent();
    });
  }

  _buildAppbar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(70),
      child: CustomAppBarWithDate(
        title: "Servis",
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
        context
            .read<ServiceListsBloc>()
            .add(ServiceGetListsRequested(dateTime: selectedDate!));
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

  _buildFlaotingButtons() {
    if (todayDate) {
      return Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FloatingActionButton(
              heroTag: "Service Account",
              onPressed: () {
                Navigator.pushNamed(context, ServiceAccountPage.routeName);
              },
              backgroundColor: GlobalVariables.secondaryColor,
              tooltip: 'Service Account',
              child: const Icon(
                Icons.calculate,
                color: Colors.white,
              ),
            ),
            FloatingActionButton(
              onPressed: () {
                Navigator.pushNamed(context, ServiceMarketsPage.routeName,
                    arguments: {0: 0, 1: true});
              },
              backgroundColor: GlobalVariables.secondaryColor,
              heroTag: 'Add Service List',
              tooltip: 'Add Service List',
              child: const Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          ],
        ),
      );
    }
    return null;
  }

  Future<bool> canEdit(int userId) async {
    var user = await UserPreferences.getUser();
    return user!.id == userId && isToday(selectedDate!);
  }
}
