// import 'package:flutter/material.dart';
// import 'package:projects/src/firestore/image_storage.dart';
//
// class MyHomePageState extends StatefulWidget {
//   const MyHomePageState({super.key});
//
//   @override
//   State<MyHomePageState> createState() => _MyHomePageStateState();
// }
//
// class _MyHomePageStateState extends State<MyHomePageState> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Firebase Image"),
//       ), // AppBar
//       body: FutureBuilder(
//         future: GetImageFromStorage(imgPath: '').getData(),
//         builder: (context, snapshot) {
//           if (snapshot.hasError) {
//             return const Text("Something went wrong"); // Text
//           }
//           if (snapshot.connectionState == ConnectionState.done) {
//             return Image.network('https://img.freepik.com/premium-vector/vector-illustration-threedimensional-brain-dark-background_395079-14888.jpg?w=826'); // Image.network
//           }
//           return const Center(child: CircularProgressIndicator());
//         },
//       ),
//     );
//   }
// }
