import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../constants/colors.dart';
import '../../../utils/skill_utils.dart';

class AboutMobileView extends StatefulWidget {
  const AboutMobileView({super.key});

  @override
  State<AboutMobileView> createState() => _AboutMobileViewState();
}

class _AboutMobileViewState extends State<AboutMobileView> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'About Me...',
          style: GoogleFonts.quicksand(
            color: CustomColor.bluePrimary,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          "Hello! I'm Yash, completed my Bachelors in Computer Engineering, based in Pune, IN.",
          style: GoogleFonts.quicksand(
            color: CustomColor.whitePrimary,
            fontSize: 17,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          "I enjoy creating things that live on the internet, whether that be websites, applications, or anything in between. My goal is to always build products that provide pixel-perfect, performant experiences.",
          style: GoogleFonts.quicksand(
            color: CustomColor.whiteSecondary,
            fontSize: 17,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          "Currently, I am pursuing my Bachelor's degree in Computer Science and Engineering at the University of Pune.",
          style: GoogleFonts.quicksand(
            color: CustomColor.whiteSecondary,
            fontSize: 17,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          "Here are a few technologies I've been working with recently:",
          style: GoogleFonts.quicksand(
            color: CustomColor.whiteSecondary,
            fontSize: 17,
          ),
        ),
        const SizedBox(height: 10),
        Container(
          height: height * 0.2, // Adjust this height based on your needs
          child: SingleChildScrollView(
            child: Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              children: [
                for (int i = 0; i < skillItems.length; i++)
                  Chip(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10.0,
                      horizontal: 14.0,
                    ),
                    backgroundColor: CustomColor.transparentColor,
                    shape: const StadiumBorder(),
                    avatar: Image.asset(skillItems[i]["img"]),
                    label: Text(
                      skillItems[i]["title"],
                      style: GoogleFonts.quicksand(
                        color: CustomColor.whitePrimary,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}