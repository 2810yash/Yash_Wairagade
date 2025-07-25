import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../constants/colors.dart';
import '../../../utils/skill_utils.dart';

class AboutDesktopView extends StatefulWidget {
  const AboutDesktopView({super.key});

  @override
  State<AboutDesktopView> createState() => _AboutDesktopViewState();
}

class _AboutDesktopViewState extends State<AboutDesktopView> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final bool isLargeScreen = width > 800;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: width/1.8,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'About Me...',
                    style: GoogleFonts.quicksand(
                      color: CustomColor.bluePrimary,
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Divider(color: CustomColor.bluePrimary,height: 10.0,)
                ],
              ),
              const SizedBox(height: 20),
              Text(
                "Hello! I'm Yash, completed my Bachelors in Computer Engineering, based in Pune, IN.",
                style: GoogleFonts.quicksand(
                  color: CustomColor.whitePrimary,
                  fontSize: isLargeScreen ? 18 : 14,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                "I enjoy creating things that live on the internet, whether that be websites, applications, or anything in between. My goal is to always build products that provide pixel-perfect, performant experiences.",
                style: GoogleFonts.quicksand(
                  color: CustomColor.whiteSecondary,
                  fontSize: isLargeScreen ? 18 : 14,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                "Currently, I am pursuing my Bachelor's degree in Computer Science and Engineering at the University of Pune.",
                style: GoogleFonts.quicksand(
                  color: CustomColor.whiteSecondary,
                  fontSize: isLargeScreen ? 18 : 14,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                "Here are a few technologies I've been working with recently:",
                style: GoogleFonts.quicksand(
                  color: CustomColor.whiteSecondary,
                  fontSize: isLargeScreen ? 18 : 14,
                ),
              ),
              const SizedBox(height: 20),
              Flexible(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: width / 2,
                  ),
                  child: Wrap(
                    spacing: 10.0,
                    runSpacing: 10.0,
                    children: [
                      for (int i = 0; i < skillItems.length; i++)
                        Chip(
                          padding: const EdgeInsets.symmetric(
                            vertical: 12.0,
                            horizontal: 16.0,
                          ),
                          backgroundColor: CustomColor.transparentColor,
                          shape: const StadiumBorder(side: BorderSide.none),
                          avatar: Image.asset(skillItems[i]["img"]),
                          label: Text(skillItems[i]["title"]),
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        // Container(
        //   margin: const EdgeInsets.only(bottom: 120.0),
        //   child: Image.asset('assets/images/goku.png'),
        // )
      ],
    );
  }
}
