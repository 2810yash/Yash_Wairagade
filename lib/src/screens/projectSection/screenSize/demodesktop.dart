import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projects/src/widgets/projectTile/desktopProjectTile.dart';
import '../../../constants/colors.dart';
import '../../../utils/project_utils.dart';

class DemoProjectDesktopView extends StatelessWidget {
  const DemoProjectDesktopView({super.key});

  @override
  Widget build(BuildContext context) {
    return const ProjectList();
  }
}

class ProjectList extends StatelessWidget {
  const ProjectList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Projects',
            style: GoogleFonts.quicksand(
              color: CustomColor.bluePrimary,
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          // StreamBuilder(
          //   // Adjust the Firestore path to match your structure
          //   stream: FirebaseFirestore.instance
          //       .collection('ash')
          //       .doc('ProjectInfo')
          //       .collection('ProjectUtils')
          //       .snapshots(),
          //   builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          //     if (snapshot.connectionState == ConnectionState.waiting) {
          //       return Center(child: CircularProgressIndicator());
          //     }
          //
          //     if (snapshot.hasError) {
          //       print('Error: ${snapshot.error}');
          //       return Center(child: Text('Error: ${snapshot.error}'));
          //     }
          //
          //     if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          //       print('No data found');
          //       return Center(child: Text('No projects available'));
          //     }
          //
          //     print('Data fetched: ${snapshot.data!.docs.length} projects');
          //
          //     final projects = snapshot.data!.docs.map((doc) {
          //       return ProjectUtils.fromFirestore(doc);
          //     }).toList();
          //
          //     return Column(
          //       mainAxisSize: MainAxisSize.min,
          //       children: [
          //         Expanded(
          //             child: ListView.builder(
          //           itemCount: projects.length,
          //           itemBuilder: (context, index) {
          //             final project = projects[index];
          //             return DesktopProjectItem(
          //               title: project.title,
          //               description: project.description,
          //               imagePath: project.image,
          //               tags: project.tags,
          //             );
          //           },
          //         ))
          //       ],
          //     );
          //   },
          // ),
          for (int i = 0; i < projects.length; i++)
            DesktopProjectItem(
              title: projects[i].title,
              description: projects[i].description,
              imagePath: projects[i].image,
              tags: projects[i].tags,
              webLink: projects[i].webLink,
              androidLink: projects[i].androidLink,
              iosLink: projects[i].iosLink,
              gitHubLink: projects[i].gitHubLink,
            ),
        ],
      ),
    );
  }
}