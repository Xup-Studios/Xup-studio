import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:xupstore/firebase_options.dart';
import 'package:xupstore/views/dashboard.dart';
import 'package:xupstore/views/downloadpage.dart';
import 'package:xupstore/views/homepage.dart';
import 'package:xupstore/views/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Login(),
    );
  }
}
