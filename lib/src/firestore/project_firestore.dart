import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';

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