// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'package:cgpa/GPA.dart';
import 'package:flutter/material.dart';
import 'CGPA.dart';
import 'SGPA.dart';

main() {
  runApp(MaterialApp(home: Home()));
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Marks Calculator"),
          centerTitle: true,
        ),
        drawer: Drawer(
          child: Column(
            children: [
              ListTile(
                leading: Icon(Icons.arrow_right),
                title: Text(
                  "GPA",
                  style: TextStyle(fontSize: 24),
                ),
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => GPA()));
                },
              ),
              ListTile(
                leading: Icon(Icons.arrow_right),
                title: Text(
                  "SGPA",
                  style: TextStyle(fontSize: 24),
                ),
                onTap: () {
                   Navigator.push(
                      context, MaterialPageRoute(builder: (context) => SGPA()));
                },
              ),
              ListTile(
                leading: Icon(Icons.arrow_right),
                title: Text(
                  "CGPA",
                  style: TextStyle(fontSize: 24),
                ),
                onTap: () {
                   Navigator.push(
                      context, MaterialPageRoute(builder: (context) => CGPA()));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
