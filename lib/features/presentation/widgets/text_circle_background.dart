import 'package:flutter/material.dart';

class CircularTextBackground extends StatelessWidget {
  final String text;
  final Color backgroundColor;

   CircularTextBackground({required this.text, required this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50.0, // Adjust the size as needed
      height: 50.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: backgroundColor,
      ),
      child: Center(
        child: Text(
          text,
          style:const TextStyle(
            color: Colors.white, // Set text color
            fontSize: 16.0, // Set text size
          ),
        ),
      ),
    );
  }
}