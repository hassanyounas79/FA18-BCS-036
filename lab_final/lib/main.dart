import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:lab_final/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    const MaterialApp(
      home: Home(),
    ),
  );
}
