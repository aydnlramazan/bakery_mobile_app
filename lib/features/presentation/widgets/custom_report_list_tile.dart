import 'package:flutter/material.dart';

import '../../../core/constants/global_variables.dart';

class CustomReportListTile extends StatelessWidget {
  final String title;
  final VoidCallback? onShowPdf;
  final VoidCallback? onSharePdf;
  const CustomReportListTile({super.key, required this.title, this.onSharePdf,this.onShowPdf});

  @override
  Widget build(BuildContext context) {
    return ListTile(

      title: Text(title),
      trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if(onShowPdf != null)
            IconButton(
              onPressed: onShowPdf,
              icon: const Icon(Icons.remove_red_eye),
              color: GlobalVariables.secondaryColor,
            ),
            if(onSharePdf != null)
              IconButton(
                onPressed: onSharePdf,
                icon: const Icon(Icons.share),
                color: GlobalVariables.secondaryColor,
              ),
          ],
        ),
    );
  }
}
