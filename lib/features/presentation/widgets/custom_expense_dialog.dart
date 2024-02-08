import 'package:bakery_app/core/utils/toast_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomExpenseDialog extends StatelessWidget {
  final String title;
  final TextEditingController expenseNameController;
  final TextEditingController expenseAmountController;
  final Function(double, String) onSave;
  const CustomExpenseDialog(
      {super.key,
      required this.title,
      required this.expenseAmountController,
      required this.expenseNameController,
      required this.onSave});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            controller: expenseNameController,
            keyboardType: TextInputType.text,
            decoration: const InputDecoration(labelText: 'Başlık'),
          ),
          TextField(
            controller: expenseAmountController,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}'))
            ],
            decoration: const InputDecoration(labelText: 'Tutar'),
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
            double amount =
                double.tryParse(expenseAmountController.text) ?? 0.0;
            if (amount != 0 && expenseNameController.text.isNotEmpty) {
              onSave(amount, expenseNameController.text);
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
