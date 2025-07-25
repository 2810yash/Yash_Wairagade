import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class ImageFromFirebase extends StatefulWidget {
  @override
  _ImageFromFirebaseState createState() => _ImageFromFirebaseState();
}

class _ImageFromFirebaseState extends State<ImageFromFirebase> {
  String imageUrl = '';
  String errorMessage = '';

  @override
  void initState() {
    super.initState();
    _loadImage();
  }

  Future<void> _loadImage() async {
    try {
      final storageRef = FirebaseStorage.instance.ref().child('carbon_fpts.jpg');
      final downloadUrl = await storageRef.getDownloadURL();
      setState(() {
        imageUrl = downloadUrl.toString();
        errorMessage = ''; // Clear any previous error message
      });
    } on FirebaseException catch (e) {
      setState(() {
        errorMessage = 'Firebase error: ${e.message}';
      });
    } catch (e) {
      setState(() {
        errorMessage = 'Error loading image: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    int a=0;
    return Scaffold(
      body: a==0?Center(
        child: imageUrl.isNotEmpty
            ? Image.network(imageUrl)
            : Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircularProgressIndicator(),
            Text(errorMessage),
          ],
        ),
      ):Center(child:Image.network('https://cors-anywhere.herokuapp.com/https://img.freepik.com/premium-vector/vector-illustration-threedimensional-brain-dark-background_395079-14888.jpg?w=826')),
    );
  }
}
