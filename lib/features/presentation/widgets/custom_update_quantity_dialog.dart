import 'package:bakery_app/core/utils/toast_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UpdateQuantityDialog extends StatelessWidget {
  final TextEditingController controller;
  final Function(int) onSave;
  final String title;
  const UpdateQuantityDialog(
      {super.key,
      required this.controller,
      required this.onSave,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: controller,
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly
            ],
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
            int newQuantity = int.tryParse(controller.text) ?? 0;
            if (newQuantity == 0) {
              showToastMessage("Bir sayı girmelisin!");
            } else {
              onSave(newQuantity);
              Navigator.of(context).pop();
            }
          },
          child: const Text('Kaydet'),
        ),
      ],
    );
  }
}
