import 'package:flutter/material.dart';
import 'package:projects/src/constants/colors.dart';
import 'package:projects/src/utils/navBar_utils.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../constants/my_handlers.dart';

class StartDrawer extends StatefulWidget {
  const StartDrawer({super.key});

  @override
  State<StartDrawer> createState() => _StartDrawerState();
}

class _StartDrawerState extends State<StartDrawer> {
  @override
  Widget build(BuildContext context) {
    final bool isSmallScreen = MediaQuery.of(context).size.width < 800;

    return Drawer(
      child: Column(
        children: [
          const SizedBox(height: 20.0),
          for (int i = 0; i < navItems.length; i++)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
              child: i != 4
                  ? ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
                  textStyle: TextStyle(fontSize: isSmallScreen ? 14 : 18),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  shadowColor: CustomColor.transparentColor,
                  backgroundColor: CustomColor.transparentColor,
                ),
                onPressed: () {
                  // Add your onPressed logic here
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    navItems[i].icon,
                    const SizedBox(width: 10.0),
                    navItems[i].text,
                  ],
                ),
              )
                  : OutlinedButton(
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
                  textStyle: TextStyle(fontSize: isSmallScreen ? 14 : 18),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  side: const BorderSide(color: CustomColor.bluePrimary), // Transparent border color
                ),
                onPressed: () => launchUrl(Uri.parse(MyUrls.myResume)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    navItems[i].icon,
                    const SizedBox(width: 10.0),
                    navItems[i].text,
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}