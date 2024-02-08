import 'package:flutter/material.dart';

import '../../../core/utils/toast_message.dart';
class CustomReceiveAmountDialog extends StatelessWidget {
    final String title;
  final TextEditingController controller;
  final Function(int) onSave;
  const CustomReceiveAmountDialog({super.key, required this.controller, required this.onSave, required this.title});
    
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            controller: controller,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(labelText: 'Adet'),
          ),
         
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Vazgeç'),
        ),
        TextButton(
          onPressed: () {
            int amount =
                int.tryParse(controller.text) ?? 0;
            if (amount != 0 ) {
              onSave(amount);
              Navigator.of(context).pop();
            } else {
              showToastMessage('İlgili alanlar boş geçilmez');
            }
          },
          child: const Text('Kaydet'),
        ),
      ],
    );
  }
}