import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../constants/colors.dart';
import '../../../constants/my_handlers.dart';
import '../../../constants/size.dart';
import 'drawer_image.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.45,
      child: Container(
        color: CustomColor.bgColor,
        child: Padding(
          padding: const EdgeInsets.only(left: 21.0),
          child: Column(
            children: [
              const Spacer(flex: 2),
              const DrawerImage(),
              const Spacer(flex: 2),
              Text(
                'Yash Wairagade',
                style: Theme.of(context).textTheme.titleSmall,
              ),
              const SizedBox(height: defaultPadding / 4),
              const Text(
                'Completed my Bachelors at AISSMS IOIT',
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.w200, height: 1.5),
              ),
              const Spacer(flex: 2),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FloatingActionButton.extended(
                    onPressed: () {
                      Navigator.pop(context);
                      // onGoToProjects();
                    },
                    heroTag: 'Projects',
                    elevation: 0,
                    backgroundColor: Colors.red,
                    label: const Text("Projects",
                        style: TextStyle(color: Colors.white, fontSize: 20)),
                    icon: const Icon(Icons.add),
                  ),
                  const SizedBox(width: 16.0),

                  FloatingActionButton.extended(
                    onPressed: () {
                      launchUrl(Uri.parse(MyUrls.myResume));
                    },
                    heroTag: 'Resume',
                    elevation: 0,
                    backgroundColor: Colors.blue,
                    label: const Text("Resume",
                        style: TextStyle(color: Colors.white, fontSize: 20)),
                    icon: const Icon(Icons.message_rounded),
                  ),
                ],
              ),
              const SizedBox(height: 10.0),
            ],
          ),
        ),
      ),
    );
  }
}
