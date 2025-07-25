import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projects/src/constants/my_handlers.dart';
import 'package:projects/src/utils/contact_utils.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants/colors.dart';

class InfoScreen extends StatefulWidget {
  const InfoScreen({super.key});

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final bool isLargeScreen = width > 1100;

    return Center(
      child: Padding(
        padding: const EdgeInsets.only(
            left: 60.0, right: 60.0),
        child: LayoutBuilder(
          builder: (context, constraints) {
            final isLargeScreen = constraints.maxWidth > 800;
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hi, my name is',
                  style: GoogleFonts.quicksand(
                    color: CustomColor.bluePrimary,
                    fontSize: isLargeScreen ? 24 : 18,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Yash Wairagade.',
                  style: GoogleFonts.quicksand(
                    color: CustomColor.whitePrimary,
                    fontWeight: FontWeight.bold,
                    fontSize: isLargeScreen ? 60 : 40,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  isLargeScreen
                      ? 'I build things for the\nAndroid and Web.'
                      : 'I build things for the Android and Web.',
                  style: GoogleFonts.quicksand(
                    color: CustomColor.whiteSecondary,
                    fontSize: isLargeScreen ? 41 : 31,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  "Completed my Bachelor's degree in Computer Engineering with a keen interest in crafting innovative applications and web sites which provide better user experiences.",
                  style: GoogleFonts.quicksand(
                    color: CustomColor.whiteSecondary,
                    fontSize: isLargeScreen ? 26 : 18,
                  ),
                ),
                const SizedBox(height: 32),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    if (isLargeScreen)
                      Flexible(
                        child: ElevatedButton(
                          onPressed: () => launchUrl(Uri.parse(MyUrls.gmail)),
                          style: ButtonStyle(
                            padding: WidgetStateProperty.all(
                              EdgeInsets.symmetric(
                                vertical: 16.0,
                                horizontal: isLargeScreen ? 24.0 : 16.0,
                              ),
                            ),
                            backgroundColor:
                                WidgetStateProperty.all(Colors.transparent),
                            side: WidgetStateProperty.all(
                              const BorderSide(color: CustomColor.bluePrimary),
                            ),
                            shape: WidgetStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                          child: Text(
                            'Get In Touch',
                            style: GoogleFonts.quicksand(
                              fontSize: isLargeScreen ? 18 : 14,
                              color: CustomColor.bluePrimary,
                            ),
                          ),
                        ),
                      ),
                    if (isLargeScreen) const SizedBox(width: 10.0),
                    for (int i = 0; i < contacts.length; i++)
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: InkWell(
                            child: Image.asset(
                              contacts[i].icon,
                              color: CustomColor.blueSecondary,
                              height: 20.0,
                            ),
                            onTap: () => launchUrl(Uri.parse(contacts[i].link)),
                          ),
                        ),
                      ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
