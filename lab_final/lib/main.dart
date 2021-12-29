import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:lab_final/home.dart';
import 'package:lab_final/splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MaterialApp(
      home: Splash(),
    ),
  );
}
