import 'package:bakery_app/core/constants/global_variables.dart';
import 'package:flutter/material.dart';

class EditableAddedProduct extends StatelessWidget {
  final String productName;
  final int quantity;
  final VoidCallback onEditPressed;
  final VoidCallback onDeletePressed;
  final int index;

  const EditableAddedProduct({
    Key? key,
    required this.productName,
    required this.quantity,
    required this.onEditPressed,
    required this.onDeletePressed,
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
            Row(
              children: [
                Text(
                  '$quantity',
                  style: const TextStyle(fontSize: 12, color: Colors.black87),
                ),
                IconButton(
                  onPressed: onEditPressed,
                  icon: const Icon(Icons.edit),
                  color: GlobalVariables.secondaryColor,
                ),
                IconButton(
                  onPressed: onDeletePressed,
                  icon: const Icon(Icons.delete),
                  color: GlobalVariables.secondaryColor,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
