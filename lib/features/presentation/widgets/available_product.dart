import 'package:bakery_app/core/constants/global_variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AvailableProductWidget extends StatelessWidget {
  final String productName;
  final TextEditingController controller;
  final VoidCallback onPressed;
  final int index;

  const AvailableProductWidget({
    Key? key,
    required this.productName,
    required this.controller,
    required this.onPressed, required this.index,
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
                SizedBox(
                  width: 60,
                  child: TextField(
                    controller: controller,
                    maxLines: 1,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black38),
                      ),
                      isDense: true,
                      contentPadding: EdgeInsets.all(8),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: onPressed,
                  icon: const Icon(Icons.add),
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
