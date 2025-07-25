import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:projects/src/screens/homePage.dart';
import 'package:projects/src/screens/splash_screen.dart';
import 'package:projects/src/utils/project_demo.dart';
import 'package:projects/src/utils/project_demo_two.dart';

import 'demo.dart';

void main() async{
  try{
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyAlUikslRnH1uE74qTSPD-GzEbFqS0BnFo",
          authDomain: "yash-wairagade-2810.firebaseapp.com",
          projectId: "yash-wairagade-2810",
          storageBucket: "yash-wairagade-2810.appspot.com",
          messagingSenderId: "969158849336",
          appId: "1:969158849336:web:fb6f513473102502e307cd",
          measurementId: "G-46MP2QQYFE"
      ),
    );
    print("***************## Wait ##***************");
  }catch (e) {
    print("***************Error initializing Firebase: $e");
  }

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      title: 'Yash Wairagade',
      home: const SplashView(),
    );
  }
}