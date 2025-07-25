import 'package:flutter/material.dart';
import 'package:projects/src/widgets/drawer/endDrawer/personal_info.dart';
import '../../../constants/colors.dart';
import '../../../constants/size.dart';
import 'about.dart';
import 'contact_icons.dart';
import 'my_skill.dart';

class EndDrawer extends StatefulWidget {
  const EndDrawer({super.key});

  @override
  State<EndDrawer> createState() => _EndDrawerState();
}

class _EndDrawerState extends State<EndDrawer> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final bool isLargeScreen = width > 1100;

    return Drawer(
      width: isLargeScreen ? 400 : 330,
      backgroundColor: CustomColor.bgColor,
      child: Column(
        children: [
          const About(),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: CustomColor.bgLight1,
              ),
              child: const Padding(
                padding: EdgeInsets.all(defaultPadding / 2),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    PersonalInfo(),
                    Text('Skills', style: TextStyle(color: Colors.white)),
                    SizedBox(height: defaultPadding - 10),
                    Expanded(
                      child: SingleChildScrollView(
                        child: MySKills(),
                      ),
                    ),
                    Divider(),
                    SizedBox(height: defaultPadding / 2),
                    ContactIcon(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
