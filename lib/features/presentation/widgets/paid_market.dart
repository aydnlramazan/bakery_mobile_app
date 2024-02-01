import 'package:bakery_app/core/constants/global_variables.dart';
import 'package:flutter/material.dart';

class PaidMarket extends StatelessWidget {
  final String marketName;
  final double totalAmount;
  final double receivedAmount;
  final VoidCallback onEditPressed;
  final VoidCallback onDeletePressed;
  final int index;

  const PaidMarket({
    Key? key,
    required this.marketName,
    required this.totalAmount,
    required this.onEditPressed,
    required this.onDeletePressed,
    required this.index,
    required this.receivedAmount
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: ListTile(
        tileColor: index.isOdd
            ? GlobalVariables.oddItemColor
            : GlobalVariables.evenItemColor,

        title: Row(
           crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(marketName),
            Row(
              children: [
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
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Toplam Tutar: $totalAmount'),
            Text('Alınan Tutar: $receivedAmount'),
            if(receivedAmount<totalAmount)
            Text('Kalan: ${totalAmount - receivedAmount}'),
          ],
        ),
      ),
    );
  }
}
