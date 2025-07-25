// import 'package:flutter/material.dart';
// import 'package:projects/src/firestore/image_storage.dart';
//
// class GetImage extends StatefulWidget {
//   const GetImage({super.key});
//
//   @override
//   State<GetImage> createState() => _GetImageState();
// }
//
// class _GetImageState extends State<GetImage> {
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<String?>(
//       future: GetImageFromStorage(imgPath: '').getData(),
//       builder: (context, snapshot) {
//         if (snapshot.hasError) {
//           return const Text("Something went wrong");
//         }
//         if (snapshot.connectionState == ConnectionState.done) {
//           if (snapshot.data != null) {
//             return Image.network('https://cors-anywhere.herokuapp.com/${snapshot.data!}');
//           } else {
//             return const Text("No data found");
//           }
//         }
//         return const Center(child: CircularProgressIndicator());
//       },
//     );
//   }
// }
