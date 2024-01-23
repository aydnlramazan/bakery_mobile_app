import 'package:bakery_app/core/constants/global_variables.dart';
import 'package:flutter/material.dart';

class CustomAppBarWithDate extends StatelessWidget
    implements PreferredSizeWidget {
  final String title;
  final String date;
  final VoidCallback? onTap;
  const CustomAppBarWithDate(
      {super.key, required this.title, required this.date, this.onTap});

  @override
  Widget build(BuildContext context) {

    return AppBar(
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          color: GlobalVariables.secondaryColor,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(15),
            bottomRight: Radius.circular(15),
          ),
        ),
      ),
      centerTitle: true,
      title: Column(
        children: [
          Text(
            title,
            style: const TextStyle(
                fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white),
          ),
          const SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: onTap,
            child: Text(
              date,
              style: const TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(70);
}
