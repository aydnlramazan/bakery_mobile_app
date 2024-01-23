import 'package:bakery_app/core/constants/global_variables.dart';
import 'package:flutter/material.dart';

class AddedProduct extends StatelessWidget {
  final String productName;
  final int quantity;
  final int index;

  const AddedProduct({
    Key? key,
    required this.productName,
    required this.quantity,
    required this.index
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: ListTile(
        tileColor: index.isOdd
            ? GlobalVariables.oddItemColor
            : GlobalVariables.evenItemColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(productName),
            Text(
              '$quantity',
              style: const TextStyle(fontSize: 12, color: Colors.black87),
            ),
          ],
        ),
      ),
    );
  }
}
