import 'dart:async';
import 'package:flutter/material.dart';
import '../animation/animation_controller.dart';
import '../animation/text_loading_animatiom.dart';
import '../constants/colors.dart';
import 'homePage.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});
  @override
  State<SplashView> createState() => _SplashViewState();
}
class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomePage(),));
    });
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: CustomColor.scaffoldBg,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AnimatedImageContainer(width: 100,height: 100,),
            SizedBox(height: 20.0,),
            AnimatedLoadingText(),
          ],
        ),
      ),
    );
  }
}
