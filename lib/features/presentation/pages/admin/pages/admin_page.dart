import 'package:bakery_app/features/presentation/pages/dough/screens/dough_list_page.dart';
import 'package:bakery_app/features/presentation/pages/production/screens/production_page.dart';
import 'package:bakery_app/features/presentation/pages/service/screens/service_lists_page.dart';
import 'package:flutter/material.dart';

import '../../../../../core/constants/global_variables.dart';
import '../../../../../core/utils/is_today_check.dart';
import '../../../../data/models/user.dart';
import '../../../widgets/custom_app_bar_with_date.dart';
import '../../../widgets/custom_report_list_tile.dart';
import '../../../widgets/custom_sell_list_tile.dart';

class AdminPage extends StatefulWidget {
  static const String routeName = "admin-page";
  final UserModel user;
  const AdminPage({super.key, required this.user});

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
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
          _reports(),
          _cashProcess(),
          _production(),
          _employeesProcess(),
          _storeCounting(),
          _productsProcess(),
          _marketProcess(),
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
        //  onTap: _selectDate,
        additionalMenuItems: const [
          PopupMenuItem<String>(
            value: 'purchesed-products',
            child: Text('Dışardan alınan ürünler'),
          ),
        ],
        onMenuItemSelected: (value) {
          if (value == 'purchesed-products') {
            //  Navigator.pushNamed(context, ProductionPage.routeName,arguments: widget.user);
          }
        },
      ),
    );
  }

  _reports() {
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
          'Raporlar',
        ),
        children: [
          CustomReportListTile(
              title: 'Günsonu',
              onShowPdf: () {
                // _updateBreadCounting(selectedDate!);
              },
              onSharePdf: todayDate
                  ? () {
                      //   _addBreadCountingDialog(selectedDate!);
                    }
                  : null),
          const Divider(
            height: 1,
            color: Colors.white,
            indent: 10,
            endIndent: 10,
          ),
          CustomReportListTile(
              title: 'Service',
              onShowPdf: () {
                // _updateBreadCounting(selectedDate!);
              },
              onSharePdf: todayDate
                  ? () {
                      //   _addBreadCountingDialog(selectedDate!);
                    }
                  : null),
          const Divider(
            height: 1,
            color: Colors.white,
            indent: 10,
            endIndent: 10,
          ),
          CustomReportListTile(
              title: 'Pastane',
              onShowPdf: () {
                // _updateBreadCounting(selectedDate!);
              },
              onSharePdf: todayDate
                  ? () {
                      //   _addBreadCountingDialog(selectedDate!);
                    }
                  : null),
          const Divider(
            height: 1,
            color: Colors.white,
            indent: 10,
            endIndent: 10,
          ),
          CustomReportListTile(
              title: 'Hamurhane',
              onShowPdf: () {
                // _updateBreadCounting(selectedDate!);
              },
              onSharePdf: todayDate
                  ? () {
                      //   _addBreadCountingDialog(selectedDate!);
                    }
                  : null),
          const Divider(
            height: 1,
            color: Colors.white,
            indent: 10,
            endIndent: 10,
          ),
          // -------NEED TO BE DONE--------
          // CustomSellListTile(
          //     title: 'Kasa',
          //     onShowDetails: () {
          //  //     _updateCashCountingDialog("Kasa Sayımı Güncelleme");
          //     },
          //     onAdd: todayDate
          //         ? () {
          //            // _addCashCountingDialog("Kasa Sayımı");
          //           }
          //         : null),
        ],
      ),
    );
  }

  _cashProcess() {
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
          'Kasa',
        ),
        children: [
          CustomSellListTile(
              title: 'Günsonu',
              onShowDetails: () {
                // _updateBreadCounting(selectedDate!);
              },
              onAdd: todayDate
                  ? () {
                      //   _addBreadCountingDialog(selectedDate!);
                    }
                  : null),
          const Divider(
            height: 1,
            color: Colors.white,
            indent: 10,
            endIndent: 10,
          ),
          CustomSellListTile(
              title: 'Hamurhane',
              onShowDetails: () {
                // _showAddedProductCountingList(1);
              },
              onAdd: todayDate
                  ? () {
                      //      _showProductCountingNotAddedList(1);
                    }
                  : null),
          const Divider(
            height: 1,
            color: Colors.white,
            indent: 10,
            endIndent: 10,
          ),
          CustomSellListTile(
              title: 'Pastane',
              onShowDetails: () {
                //   _showAddedProductCountingList(2);
              },
              onAdd: todayDate
                  ? () {
                      //        _showProductCountingNotAddedList(2);
                    }
                  : null),
          const Divider(
            height: 1,
            color: Colors.white,
            indent: 10,
            endIndent: 10,
          ),
          CustomSellListTile(
              title: 'Servis',
              onShowDetails: () {
                //    _showAddedProductCountingList(3);
              },
              onAdd: todayDate
                  ? () {
                      //           _showProductCountingNotAddedList(3);
                    }
                  : null),
          const Divider(
            height: 1,
            color: Colors.white,
            indent: 10,
            endIndent: 10,
          ),
          // -------NEED TO BE DONE--------
          // CustomSellListTile(
          //     title: 'Kasa',
          //     onShowDetails: () {
          //  //     _updateCashCountingDialog("Kasa Sayımı Güncelleme");
          //     },
          //     onAdd: todayDate
          //         ? () {
          //            // _addCashCountingDialog("Kasa Sayımı");
          //           }
          //         : null),
        ],
      ),
    );
  }

  _production() {
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
          'İmalat',
        ),
        children: [
          ListTile(
            title: const Text('Servis'),
            trailing: IconButton(
              onPressed: () {
                _navigateToPage(ServiceListPage.routeName,widget.user);
              },
              icon: const Icon(Icons.navigate_next),
              color: GlobalVariables.secondaryColor,
            ),
          ),
          const Divider(
            height: 1,
            color: Colors.white,
            indent: 10,
            endIndent: 10,
          ),
          ListTile(
            title: const Text('Hamurhane'),
            trailing: IconButton(
              onPressed: () {
                _navigateToPage(DoughListPage.routeName,widget.user);
              },
              icon: const Icon(Icons.navigate_next),
              color: GlobalVariables.secondaryColor,
            ),
          ),
          const Divider(
            height: 1,
            color: Colors.white,
            indent: 10,
            endIndent: 10,
          ),
          ListTile(
            title: const Text('Pastane'),
            trailing: IconButton(
              onPressed: () {
                _navigateToPage(ProductionPage.routeName,{0:widget.user,1:1});
              },
              icon: const Icon(Icons.navigate_next),
              color: GlobalVariables.secondaryColor,
            ),
          ),
          const Divider(
            height: 1,
            color: Colors.white,
            indent: 10,
            endIndent: 10,
          ),
          ListTile(
            title: const Text('Börek'),
            trailing: IconButton(
              onPressed: () {
                _navigateToPage(ProductionPage.routeName,{0:widget.user,1:2});
              },
              icon: const Icon(Icons.navigate_next),
              color: GlobalVariables.secondaryColor,
            ),
          ),
          const Divider(
            height: 1,
            color: Colors.white,
            indent: 10,
            endIndent: 10,
          ),
          //  -------NEED TO BE DONE--------
          ListTile(
            title: const Text('Dışardan alınan'),
            trailing: IconButton(
              onPressed: () {
                _navigateToPage(ProductionPage.routeName,{0:widget.user,1:3});
              },
              icon: const Icon(Icons.navigate_next),
              color: GlobalVariables.secondaryColor,
            ),
          ),
        ],
      ),
    );
  }

  _storeCounting() {
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
          'Depo',
        ),
        children: [
          CustomSellListTile(
              title: 'Günsonu',
              onShowDetails: () {
                // _updateBreadCounting(selectedDate!);
              },
              onAdd: todayDate
                  ? () {
                      //   _addBreadCountingDialog(selectedDate!);
                    }
                  : null),
          const Divider(
            height: 1,
            color: Colors.white,
            indent: 10,
            endIndent: 10,
          ),
          CustomSellListTile(
              title: 'Hamurhane',
              onShowDetails: () {
                // _showAddedProductCountingList(1);
              },
              onAdd: todayDate
                  ? () {
                      //      _showProductCountingNotAddedList(1);
                    }
                  : null),
          const Divider(
            height: 1,
            color: Colors.white,
            indent: 10,
            endIndent: 10,
          ),
          CustomSellListTile(
              title: 'Pastane',
              onShowDetails: () {
                //   _showAddedProductCountingList(2);
              },
              onAdd: todayDate
                  ? () {
                      //        _showProductCountingNotAddedList(2);
                    }
                  : null),
          const Divider(
            height: 1,
            color: Colors.white,
            indent: 10,
            endIndent: 10,
          ),
          CustomSellListTile(
              title: 'Servis',
              onShowDetails: () {
                //    _showAddedProductCountingList(3);
              },
              onAdd: todayDate
                  ? () {
                      //           _showProductCountingNotAddedList(3);
                    }
                  : null),
          const Divider(
            height: 1,
            color: Colors.white,
            indent: 10,
            endIndent: 10,
          ),
          // -------NEED TO BE DONE--------
          // CustomSellListTile(
          //     title: 'Kasa',
          //     onShowDetails: () {
          //  //     _updateCashCountingDialog("Kasa Sayımı Güncelleme");
          //     },
          //     onAdd: todayDate
          //         ? () {
          //            // _addCashCountingDialog("Kasa Sayımı");
          //           }
          //         : null),
        ],
      ),
    );
  }

  _employeesProcess() {
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
          'Personel',
        ),
        children: [
          CustomSellListTile(
              title: 'Günsonu',
              onShowDetails: () {
                // _updateBreadCounting(selectedDate!);
              },
              onAdd: todayDate
                  ? () {
                      //   _addBreadCountingDialog(selectedDate!);
                    }
                  : null),
          const Divider(
            height: 1,
            color: Colors.white,
            indent: 10,
            endIndent: 10,
          ),
          CustomSellListTile(
              title: 'Hamurhane',
              onShowDetails: () {
                // _showAddedProductCountingList(1);
              },
              onAdd: todayDate
                  ? () {
                      //      _showProductCountingNotAddedList(1);
                    }
                  : null),
          const Divider(
            height: 1,
            color: Colors.white,
            indent: 10,
            endIndent: 10,
          ),
          CustomSellListTile(
              title: 'Pastane',
              onShowDetails: () {
                //   _showAddedProductCountingList(2);
              },
              onAdd: todayDate
                  ? () {
                      //        _showProductCountingNotAddedList(2);
                    }
                  : null),
          const Divider(
            height: 1,
            color: Colors.white,
            indent: 10,
            endIndent: 10,
          ),
          CustomSellListTile(
              title: 'Servis',
              onShowDetails: () {
                //    _showAddedProductCountingList(3);
              },
              onAdd: todayDate
                  ? () {
                      //           _showProductCountingNotAddedList(3);
                    }
                  : null),
          const Divider(
            height: 1,
            color: Colors.white,
            indent: 10,
            endIndent: 10,
          ),
          // -------NEED TO BE DONE--------
          // CustomSellListTile(
          //     title: 'Kasa',
          //     onShowDetails: () {
          //  //     _updateCashCountingDialog("Kasa Sayımı Güncelleme");
          //     },
          //     onAdd: todayDate
          //         ? () {
          //            // _addCashCountingDialog("Kasa Sayımı");
          //           }
          //         : null),
        ],
      ),
    );
  }

  _productsProcess() {
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
          'Ürünler',
        ),
        children: [
          CustomSellListTile(
              title: 'Günsonu',
              onShowDetails: () {
                // _updateBreadCounting(selectedDate!);
              },
              onAdd: todayDate
                  ? () {
                      //   _addBreadCountingDialog(selectedDate!);
                    }
                  : null),
          const Divider(
            height: 1,
            color: Colors.white,
            indent: 10,
            endIndent: 10,
          ),
          CustomSellListTile(
              title: 'Hamurhane',
              onShowDetails: () {
                // _showAddedProductCountingList(1);
              },
              onAdd: todayDate
                  ? () {
                      //      _showProductCountingNotAddedList(1);
                    }
                  : null),
          const Divider(
            height: 1,
            color: Colors.white,
            indent: 10,
            endIndent: 10,
          ),
          CustomSellListTile(
              title: 'Pastane',
              onShowDetails: () {
                //   _showAddedProductCountingList(2);
              },
              onAdd: todayDate
                  ? () {
                      //        _showProductCountingNotAddedList(2);
                    }
                  : null),
          const Divider(
            height: 1,
            color: Colors.white,
            indent: 10,
            endIndent: 10,
          ),
          CustomSellListTile(
              title: 'Servis',
              onShowDetails: () {
                //    _showAddedProductCountingList(3);
              },
              onAdd: todayDate
                  ? () {
                      //           _showProductCountingNotAddedList(3);
                    }
                  : null),
          const Divider(
            height: 1,
            color: Colors.white,
            indent: 10,
            endIndent: 10,
          ),
          // -------NEED TO BE DONE--------
          // CustomSellListTile(
          //     title: 'Kasa',
          //     onShowDetails: () {
          //  //     _updateCashCountingDialog("Kasa Sayımı Güncelleme");
          //     },
          //     onAdd: todayDate
          //         ? () {
          //            // _addCashCountingDialog("Kasa Sayımı");
          //           }
          //         : null),
        ],
      ),
    );
  }

  _marketProcess() {
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
          'Marketler',
        ),
        children: [
          CustomSellListTile(
              title: 'Günsonu',
              onShowDetails: () {
                // _updateBreadCounting(selectedDate!);
              },
              onAdd: todayDate
                  ? () {
                      //   _addBreadCountingDialog(selectedDate!);
                    }
                  : null),
          const Divider(
            height: 1,
            color: Colors.white,
            indent: 10,
            endIndent: 10,
          ),
          CustomSellListTile(
              title: 'Hamurhane',
              onShowDetails: () {
                // _showAddedProductCountingList(1);
              },
              onAdd: todayDate
                  ? () {
                      //      _showProductCountingNotAddedList(1);
                    }
                  : null),
          const Divider(
            height: 1,
            color: Colors.white,
            indent: 10,
            endIndent: 10,
          ),
          CustomSellListTile(
              title: 'Pastane',
              onShowDetails: () {
                //   _showAddedProductCountingList(2);
              },
              onAdd: todayDate
                  ? () {
                      //        _showProductCountingNotAddedList(2);
                    }
                  : null),
          const Divider(
            height: 1,
            color: Colors.white,
            indent: 10,
            endIndent: 10,
          ),
          CustomSellListTile(
              title: 'Servis',
              onShowDetails: () {
                //    _showAddedProductCountingList(3);
              },
              onAdd: todayDate
                  ? () {
                      //           _showProductCountingNotAddedList(3);
                    }
                  : null),
          const Divider(
            height: 1,
            color: Colors.white,
            indent: 10,
            endIndent: 10,
          ),
          // -------NEED TO BE DONE--------
          // CustomSellListTile(
          //     title: 'Kasa',
          //     onShowDetails: () {
          //  //     _updateCashCountingDialog("Kasa Sayımı Güncelleme");
          //     },
          //     onAdd: todayDate
          //         ? () {
          //            // _addCashCountingDialog("Kasa Sayımı");
          //           }
          //         : null),
        ],
      ),
    );
  }

   _navigateToPage(String routeName, dynamic args) {
    args == null
        ? Navigator.pushNamed(
            context, routeName, )
        : Navigator.pushNamed(
            context, routeName, arguments: args,);
  }
}
