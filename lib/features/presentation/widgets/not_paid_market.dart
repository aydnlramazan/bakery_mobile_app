import 'package:flutter/material.dart';

import '../../../core/constants/global_variables.dart';

class NotPaidMarket extends StatelessWidget {
  final int index;
  final String marketName;
  final int givenBread;
  final double totalAmount;
  final VoidCallback onTap;
  final int staleBread;
  const NotPaidMarket(
      {super.key,
      required this.index,
      required this.marketName,
      required this.givenBread,
      required this.totalAmount,
      required this.onTap,required this.staleBread});

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
            Text('$totalAmount₺'),
          ],
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Toplam Adet: $givenBread'),
            if(staleBread != 0)
            Text('Bayat: $staleBread'),
            if(staleBread != 0)
            Text('Net Adet: ${givenBread -staleBread}')
          ],
        ),
        trailing: IconButton(
            onPressed: onTap,
            icon: const Icon(Icons.money),
            color: GlobalVariables.secondaryColor),
      ),
    );
  }
}
