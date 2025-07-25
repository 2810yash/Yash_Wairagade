import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../../firestore/image_storage.dart';
import '../../../firestore/project_firestore.dart';
import '../../../widgets/projectTile/mobileProjectTile.dart';

class ProjectMobileView extends StatefulWidget {
  const ProjectMobileView({super.key});

  @override
  State<ProjectMobileView> createState() => _ProjectMobileViewState();
}

class _ProjectMobileViewState extends State<ProjectMobileView> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('ash')
          .doc('ProjectInfo')
          .collection('ProjectUtils')
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }

        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return const Center(child: Text('No projects available'));
        }

        final projects = snapshot.data!.docs.map((doc) {
          return ProjectUtils.fromFirestore(doc);
        }).toList();

        return SizedBox(
          height: 1700,
          child: ListView.builder(
            itemCount: projects.length,
            itemBuilder: (context, index) {
              final project = projects[index];
              return FutureBuilder<String?>(
                future: GetImageFromStorage(imgPath: project.image).getData(),
                builder: (context, imageSnapshot) {
                  if (imageSnapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (imageSnapshot.hasError || imageSnapshot.data == null) {
                    return MobileProjectItem(
                      title: project.title,
                      description: project.description,
                      imagePath: 'https://img.freepik.com/premium-vector/vector-illustration-threedimensional-brain-dark-background_395079-14888.jpg?w=826', // Provide a default image path
                      tags: project.tags,
                      gitHubLink: project.gitHubLink,
                      webLink: project.webLink,
                      androidLink: project.androidLink,
                      iosLink: project.iosLink,
                    );
                  }

                  return MobileProjectItem(
                    title: project.title,
                    description: project.description,
                    imagePath: imageSnapshot.data.toString(),
                    tags: project.tags,
                    gitHubLink: project.gitHubLink,
                    webLink: project.webLink,
                    androidLink: project.androidLink,
                    iosLink: project.iosLink,
                  );
                },
              );
            },
          ),
        );
      },
    );
  }
}
