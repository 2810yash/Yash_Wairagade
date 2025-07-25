import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

import '../widgets/projectTile/desktopProjectTile.dart';

class ProjectUtils {
  final String image;
  final String title;
  final String description;
  final List<String> tags;
  final String? androidLink;
  final String? iosLink;
  final String? webLink;
  final String? gitHubLink;

  ProjectUtils({
    required this.image,
    required this.title,
    required this.description,
    required this.tags,
    this.androidLink,
    this.iosLink,
    this.webLink,
    this.gitHubLink,
  });

  // Factory method to create a ProjectUtils instance from a Firestore document
  factory ProjectUtils.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

    return ProjectUtils(
      image: data['image'] ?? '',
      title: data['title'] ?? '',
      description: data['description'] ?? '',
      // Use jsonDecode to parse the tags from a JSON string to a List<String>
      tags: data['tags'] is String
          ? List<String>.from(jsonDecode(data['tags']))
          : List<String>.from(data['tags'] ?? []),
      androidLink: data['androidLink'],
      iosLink: data['iosLink'],
      webLink: data['webLink'],
      gitHubLink: data['gitHubLink'],
    );
  }
}

class MyProjectsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('My Projects')),
      body: StreamBuilder(
        // Adjust the Firestore path to match your structure
        stream: FirebaseFirestore.instance
            .collection('ash')
            .doc('ProjectInfo')
            .collection('ProjectUtils')
            .snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            print('Error: ${snapshot.error}');
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            print('No data found');
            return Center(child: Text('No projects available'));
          }

          print('Data fetched: ${snapshot.data!.docs.length} projects');

          final projects = snapshot.data!.docs.map((doc) {
            return ProjectUtils.fromFirestore(doc);
          }).toList();

          return ListView.builder(
            itemCount: projects.length,
            itemBuilder: (context, index) {
              final project = projects[index];
              return DesktopProjectItem(
                title: project.title,
                description: project.description,
                imagePath: project.image,
                tags: project.tags,
              );
            },
          );
        },
      ),
    );
  }
}
