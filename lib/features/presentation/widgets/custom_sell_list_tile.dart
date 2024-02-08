import 'package:flutter/material.dart';

import '../../../core/constants/global_variables.dart';

class CustomSellListTile extends StatelessWidget {
  final String title;
  final VoidCallback? onShowDetails;
  final VoidCallback? onAdd;
  const CustomSellListTile({super.key, required this.title, this.onAdd,this.onShowDetails});

  @override
  Widget build(BuildContext context) {
    return ListTile(

      title: Text(title),
      trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if(onShowDetails != null)
            IconButton(
              onPressed: onShowDetails,
              icon: const Icon(Icons.list),
              color: GlobalVariables.secondaryColor,
            ),
            if(onAdd != null)
              IconButton(
                onPressed: onAdd,
                icon: const Icon(Icons.add),
                color: GlobalVariables.secondaryColor,
              ),
          ],
        ),
    );
  }
}
