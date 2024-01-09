import 'package:bakery_app/core/constants/constants.dart';
import 'package:bakery_app/core/constants/global_variables.dart';
import 'package:bakery_app/features/presentation/bloc/dough_factory/dough_factory_bloc.dart';
import 'package:bakery_app/features/presentation/pages/dough_product_page.dart';
import 'package:bakery_app/features/presentation/widgets/custom_app_bar.dart';
import 'package:bakery_app/features/presentation/widgets/text_circle_background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class DoughListPage extends StatefulWidget {
  static const String routeName = "dough-list-page";

  const DoughListPage({super.key});

  @override
  State<DoughListPage> createState() => _DoughListPageState();
}

class _DoughListPageState extends State<DoughListPage> {
  static String date = "Today";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(),
      floatingActionButton: _buildFloatingButton(),
      body: _buildBody()
    );
  }

  _buildBody(){
      return BlocConsumer<DoughFactoryBloc, DoughFactoryState>(
          listener: (context, state) {
        if (state is DoughFactorySuccess) {
          Navigator.pushNamedAndRemoveUntil(
              context, DoughListPage.routeName, (route) => false);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                state.doughLists!.length.toString(),
              ),
            ),
          );
        }

        if (state is DoughFactoryFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                state.error as String,
              ),
            ),
          );
        }
      }, builder: (context, state) {
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
                      leading: Text((index +1).toString(),style:const TextStyle(fontSize: 18, color:GlobalVariables.secondaryColor),),
                      title: Text(state.doughLists![index].userName!, textScaleFactor: 1.2,),
                      subtitle: Text(getFormattedDateTime(state.doughLists![index].date!), ),
                      onTap: () { 
                        
                      },
                      ),
                  ),
                );
              });
        }
        return Center(
          child:  Container(
        
            child: Lottie.asset('assets/empty_box.json',
                              repeat: false, animate: true),
          ),
        );
      });
  }

  _buildFloatingButton() {
    return FloatingActionButton(
      onPressed: () {
        Navigator.pushNamed(context, DoughProductPage.routeName);
      },
      backgroundColor: GlobalVariables.secondaryColor,
      tooltip: 'Add Dough List',
      child: const Icon(
        Icons.add,
        color: Colors.white,
      ),
    );
  }

  _buildAppbar() {
    return PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: CustomAppBar(
          title: "Dough Factory",
          date: date,
          onTap: _selectDate,
        ));
  }

  Future<void> _selectDate() async {
    DateTime? _picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2023),
        lastDate: DateTime.now());
    if (_picked != null) {
      setState(() {
        date = _picked.toString().split(" ")[0];
        context
            .read<DoughFactoryBloc>()
            .add(DoughListsRequested(dateTime: _picked));
      });
    }
  }
}
