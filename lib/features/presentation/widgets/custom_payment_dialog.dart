import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomPaymentDialog extends StatelessWidget {
  final String title;
  final String? firstText;
  final String? secondText;
  final TextEditingController controller;
  final Function(double) onSave;
  const CustomPaymentDialog(
      {super.key,
      required this.title,
      this.firstText,
      this.secondText,
      required this.controller,
      required this.onSave});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (firstText != null) Text(firstText!),
          if (secondText != null) Text(secondText!),
          TextField(
            controller: controller,
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
            double newQuantity = double.tryParse(controller.text) ?? 0.0;
       
            onSave(newQuantity);
            Navigator.of(context).pop();
          },
          child: const Text('Kaydet'),
        ),
      ],
    );
  }
}
