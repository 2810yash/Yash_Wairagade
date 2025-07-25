import 'package:flutter/material.dart';
import 'package:projects/src/screens/adoutSection/screenSize/desktopView.dart';
import 'package:projects/src/screens/adoutSection/screenSize/mobileView.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final bool isLargeScreen = width > 1100;

    return Padding(
        padding: const EdgeInsets.only(top: 0.0, left: 60.0, right: 60.0),
        child:
            isLargeScreen ? const AboutDesktopView() : const AboutMobileView());
  }
}
