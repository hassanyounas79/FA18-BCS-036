// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';

class CGPA extends StatefulWidget {
  @override
  State<CGPA> createState() => _CGPAState();
}

class _CGPAState extends State<CGPA> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
         appBar: AppBar(
          title: Text("CGPA Calculator"),
          centerTitle: true,
        ),
      ),
    );
  }
}
