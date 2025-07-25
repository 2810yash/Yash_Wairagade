import 'package:flutter/material.dart';
import 'package:projects/src/screens/adoutSection/about.dart';
import 'package:projects/src/screens/pageFooter/footerSection.dart';
import 'package:projects/src/screens/projectSection/projectSection.dart';
import '../utils/project_demo.dart';
import '../widgets/drawer/startDrawer.dart';
import '../widgets/drawer/endDrawer/endDrawer.dart';
import '../widgets/navBar/navBar.dart';
import 'info.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height - 57;
    final bool isLargeScreen = width > 800;

    return Scaffold(
      key: _scaffoldKey,
      appBar: ResponsiveNavBarPage(
          scaffoldKey: _scaffoldKey, isLargeScreen: isLargeScreen),
      drawer: isLargeScreen ? null : const StartDrawer(),
      endDrawer: const EndDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: height,
              width: width,
              child: const InfoScreen(),
            ),
            SizedBox(
              height: height,
              width: width,
              child: const AboutScreen(),
            ),
            const ProjectSection(),
            SizedBox(
              width: width,
              height: height / 2,
              child: const Footer(),
            ),
          ],
        ),
      ),
    );
  }
}
