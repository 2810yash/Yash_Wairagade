import 'package:flutter/material.dart';
import 'package:projects/src/screens/pageFooter/screenSize/desktopView.dart';
import 'package:projects/src/screens/pageFooter/screenSize/mobileView.dart';

class Footer extends StatefulWidget {
  const Footer({super.key});

  @override
  State<Footer> createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final bool isLargeScreen = width > 1100;

    return Padding(
        padding: const EdgeInsets.only(left: 60.0, right: 60.0),
        child: isLargeScreen
            ? const FooterDesktopView()
            : const FooterMobileView()
    );
  }
}
