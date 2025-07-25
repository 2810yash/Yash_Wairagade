import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../../firestore/image_storage.dart';
import '../../../firestore/project_firestore.dart';
import '../../../widgets/projectTile/desktopProjectTile.dart';

class ProjectDesktopView extends StatefulWidget {
  const ProjectDesktopView({super.key});

  @override
  State<ProjectDesktopView> createState() => _ProjectDesktopViewState();
}

class _ProjectDesktopViewState extends State<ProjectDesktopView> {
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
                future: project.image != null && project.image!.isNotEmpty
                    ? GetImageFromStorage(imgPath: project.image).getData()
                    : Future.value(null),
                builder: (context, imageSnapshot) {
                  if (imageSnapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (imageSnapshot.hasError || imageSnapshot.data == null) {
                    return DesktopProjectItem(
                      title: project.title,
                      description: project.description,
                      imagePath: 'https://img.freepik.com/premium-vector/vector-illustration-threedimensional-brain-dark-background_395079-14888.jpg?w=826', // Default image URL
                      tags: project.tags,
                      gitHubLink: project.gitHubLink,
                      webLink: project.webLink,
                      androidLink: project.androidLink,
                      iosLink: project.iosLink,
                    );
                  }

                  return DesktopProjectItem(
                    title: project.title,
                    description: project.description,
                    imagePath: imageSnapshot.data!,
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