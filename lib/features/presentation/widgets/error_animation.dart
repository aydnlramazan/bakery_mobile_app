import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ErrorAnimation extends StatelessWidget {
  const ErrorAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
          padding:const EdgeInsets.all(20),
    
          child: Lottie.asset('assets/animation_error.json',
              repeat: false, animate: true),
        ),
      );
  }
}