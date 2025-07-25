import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../constants/colors.dart';

class MobileProjectItem extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath;
  final List<String> tags;
  final String? androidLink;
  final String? iosLink;
  final String? webLink;
  final String? gitHubLink;

  const MobileProjectItem({
    super.key,
    required this.title,
    required this.description,
    required this.imagePath,
    required this.tags,
    this.androidLink,
    this.iosLink,
    this.webLink,
    this.gitHubLink,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final bool isLargeScreen = width > 800;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          SizedBox(
            height: 300, // Define a fixed height for the image
            child: Image.network(
              imagePath,
              fit: BoxFit.cover,
              width: 250,
            ),
          ),
          const SizedBox(height: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: GoogleFonts.quicksand(
                  color: CustomColor.whitePrimary,
                  fontSize: isLargeScreen ? 22 : 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                description,
                style: GoogleFonts.quicksand(
                  color: CustomColor.whiteSecondary,
                  fontSize: isLargeScreen ? 18 : 14,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: tags
                        .map((tag) => Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Chip(
                        backgroundColor: CustomColor.transparentColor,
                        shape: const StadiumBorder(
                            side: BorderSide.none),
                        label: Text(
                          tag,
                          style: GoogleFonts.quicksand(
                            color: CustomColor.blueSecondary,
                          ),
                        ),
                      ),
                    ))
                        .toList(),
                  ),
                  Row(
                    children: [
                      if (androidLink != null)
                        IconButton(
                          onPressed: () => launchUrl(Uri.parse(androidLink!)),
                          icon: const Icon(Icons.android),
                        ),
                      if (iosLink != null)
                        IconButton(
                          onPressed: () => launchUrl(Uri.parse(iosLink!)),
                          icon: const Icon(Icons.apple),
                        ),
                      if (webLink != null)
                        IconButton(
                          onPressed: () => launchUrl(Uri.parse(webLink!)),
                          icon: const Icon(Icons.web),
                        ),
                      if (gitHubLink != null)
                        IconButton(
                          onPressed: () => launchUrl(Uri.parse(gitHubLink!)),
                          icon: Image.asset(
                            "assets/images/gitHub.png",
                            height: 20,
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> _launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
