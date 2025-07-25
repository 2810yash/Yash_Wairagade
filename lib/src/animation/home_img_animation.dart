import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class MyLottieWidget extends StatefulWidget {
  const MyLottieWidget({super.key});

  @override
  State<MyLottieWidget> createState() => _MyLottieWidgetState();
}

class _MyLottieWidgetState extends State<MyLottieWidget> {
  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      'assets/lottie/myPortfolio.json',
      repeat: false,
      // height: 150.0,
    );
  }
}
