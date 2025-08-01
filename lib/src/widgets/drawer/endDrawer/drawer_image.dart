import 'package:flutter/material.dart';

import '../../../constants/size.dart';

class DrawerImage extends StatelessWidget {
  const DrawerImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 150,
      padding: const EdgeInsets.all(defaultPadding/6),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          gradient: LinearGradient(
            colors: [
              Colors.pink,
              Colors.blue.shade900,
            ],
          ),
          boxShadow: const [
            BoxShadow(color: Colors.pink,blurRadius: 10,offset: Offset(0, 2)),
            BoxShadow(color: Colors.blue,blurRadius: 10,offset: Offset(0, -2)),
          ]
      ),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: Transform.rotate(
              angle: 0.0,
              child: Image.asset('assets/images/profile.jpg',fit: BoxFit.cover,))),
    );
  }
}
