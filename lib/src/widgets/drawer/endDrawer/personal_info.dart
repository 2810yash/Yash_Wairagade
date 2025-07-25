import 'package:flutter/material.dart';
import '../../../constants/my_handlers.dart';
import '../../../constants/size.dart';
import 'header_info.dart';

class PersonalInfo extends StatelessWidget {
  const PersonalInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: defaultPadding / 2),
        // AreaInfoText(title: 'Contact', text: MyUsername.myNumber),
        AreaInfoText(title: 'Email', text: MyUsername.myGmail),
        AreaInfoText(title: 'LinkedIn', text: MyUsername.linkedIn),
        AreaInfoText(title: 'Github', text: MyUsername.gitHub),
        Divider(),
        SizedBox(height: defaultPadding / 2),
      ],
    );
  }
}
