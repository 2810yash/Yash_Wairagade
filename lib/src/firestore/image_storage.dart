import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class GetImageFromStorage {
  final String? imgPath; // Ensure this is not null
  String? downURL;

  GetImageFromStorage({required this.imgPath});

  Future<String?> getData() async {
    try {
      if (imgPath == null || imgPath!.isEmpty) {
        throw Exception("Image path is not provided");
      }
      await downloadURL();
      return downURL;
    } catch (e) {
      debugPrint("Error from firebaseStorage - $e");
      return null;
    }
  }

  Future<void> downloadURL() async {
    downURL = await FirebaseStorage.instance
        .ref()
        .child(imgPath!) // Reference the specific child path
        .getDownloadURL();
    debugPrint(downURL.toString());
  }
}