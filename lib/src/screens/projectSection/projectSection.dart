import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projects/src/screens/projectSection/screenSize/desktopView.dart';
import 'package:projects/src/screens/projectSection/screenSize/mobileView.dart';

import '../../constants/colors.dart';

class ProjectSection extends StatefulWidget {
  const ProjectSection({super.key});

  @override
  State<ProjectSection> createState() => _ProjectSectionState();
}

class _ProjectSectionState extends State<ProjectSection> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final bool isLargeScreen = width > 1100;

    return Padding(
      padding: const EdgeInsets.only(top: 0.0, left: 60.0, right: 60.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Projects',
            textAlign: TextAlign.left,
            style: GoogleFonts.quicksand(
              color: CustomColor.bluePrimary,
              fontSize: isLargeScreen ? 36 : 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          isLargeScreen
              ? const ProjectDesktopView()
              : const ProjectMobileView(),
        ],
      ),
    );
  }
}
