// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';

class SGPA extends StatefulWidget {
  @override
  State<SGPA> createState() => _SGPAState();
}

class _SGPAState extends State<SGPA> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
         appBar: AppBar(
          title: Text("SGPA Calculator"),
          centerTitle: true,
        ),
      ),
    );
  }
}
