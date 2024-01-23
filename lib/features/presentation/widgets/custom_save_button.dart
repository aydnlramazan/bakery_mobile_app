import 'package:bakery_app/core/constants/global_variables.dart';
import 'package:flutter/material.dart';

class CustomSaveButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  const CustomSaveButton({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onTap,
     style: ElevatedButton.styleFrom(
      backgroundColor: GlobalVariables.secondaryColor,
        shape:const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15.0),
            topRight: Radius.circular(15.0),
          ),
        ),
      ),
    child:Container(
        padding:const EdgeInsets.symmetric(vertical: 15.0),
        child: Text(
          text,
          style:const TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: Colors.white),
        ),
      ),);
  }
}
