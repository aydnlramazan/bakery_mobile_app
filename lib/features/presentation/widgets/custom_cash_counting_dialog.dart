import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomCashCountingDialog extends StatelessWidget {
  final String title;
  final TextEditingController reminedController;
  final TextEditingController totalController;
  final TextEditingController creditcartController;
   final Function(double totalCash,double reminedCash,double creditcart) onSave;

  const CustomCashCountingDialog({super.key, required this.title, required this.reminedController, required this.totalController, required this.creditcartController, required this.onSave});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            controller: totalController,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}'))
            ],
            decoration: const InputDecoration(labelText: 'Net Nakit'),
          ),
          TextField(
            controller: reminedController,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}'))
            ],
            decoration: const InputDecoration(labelText: 'Kasada Kalan'),
          ),
          TextField(
            controller: creditcartController,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}'))
            ],
            decoration: const InputDecoration(labelText: 'Kredi Kart'),
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
            double totalCash = double.tryParse(totalController.text) ?? 0.0;
            double reminedCash = double.tryParse(reminedController.text) ?? 0.0;
            double creditcart = double.tryParse(creditcartController.text) ?? 0.0;
            
            onSave(totalCash,reminedCash,creditcart);
            Navigator.of(context).pop();
          },
          child: const Text('Kaydet'),
        ),
      ],
    );
  }
}