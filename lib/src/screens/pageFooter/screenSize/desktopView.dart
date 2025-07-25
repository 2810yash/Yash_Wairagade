import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../constants/colors.dart';
import '../../../constants/my_handlers.dart';

class FooterDesktopView extends StatefulWidget {
  const FooterDesktopView({super.key});

  @override
  State<FooterDesktopView> createState() => _FooterDesktopViewState();
}

class _FooterDesktopViewState extends State<FooterDesktopView> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final bool isLargeScreen = width > 800;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // const SizedBox(height: 20),
          Text(
            'Get In Touch',
            style: GoogleFonts.quicksand(
              color: CustomColor.bluePrimary,
              fontSize: isLargeScreen ? 36 : 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'Although I\'m currently looking for Flutter Internship, \nmy inbox is always open. Whether you have a question or want to collaborate, \nI\'ll try my best to get back to you!',
            textAlign: TextAlign.center,
            style: GoogleFonts.quicksand(
              color: CustomColor.whiteSecondary,
              fontSize: isLargeScreen ? 18 : 14,
            ),
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: () => launchUrl(Uri.parse(MyUrls.gmail)),
            style: ElevatedButton.styleFrom(
              backgroundColor: CustomColor.transparentColor,
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
                side: const BorderSide(color: CustomColor.blueSecondary),
              ),
            ),
            child: Text(
              'Say Hello',
              style: GoogleFonts.quicksand(
                color: CustomColor.blueSecondary,
                fontSize: isLargeScreen ? 18 : 14,
              ),
            ),
          ),
          const SizedBox(height: 50),
          Text(
            'Designed & Built by Yash Wairagade 💙 Flutter',
            textAlign: TextAlign.center,
            style: GoogleFonts.quicksand(
              color: CustomColor.whiteSecondary,
              fontSize: isLargeScreen ? 16 : 12,
            ),
          ),
        ],
      ),
    );
  }
}
