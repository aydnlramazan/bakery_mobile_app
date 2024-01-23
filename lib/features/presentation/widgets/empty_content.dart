import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class EmptyContent extends StatelessWidget {
  const EmptyContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
          width: double.infinity,
          color: Colors.white,
          child: Lottie.asset('assets/empty_box.json',
              repeat: false, animate: true),
        ),
      );
  }
}