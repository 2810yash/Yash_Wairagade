import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../utils/contact_utils.dart';

class ContactIcon extends StatelessWidget {
  const ContactIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            for (int i = 0; i < contacts.length; i++)
              InkWell(
                child: Image.asset(
                  contacts[i].icon,
                  color: Colors.white,
                  height: 20.0,
                ),
                onTap: () {
                  launchUrl(Uri.parse(contacts[i].link));
                },
              ),
          ],
        ),
        const SizedBox(height: 20.0),
      ],
    );
  }
}
