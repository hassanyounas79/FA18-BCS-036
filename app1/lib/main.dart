// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:app1/alphabet.dart';
import 'package:app1/splash.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Splash(),
    ),
  );
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Alphabet App"),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: Image(
                image: AssetImage("images/R.png"),
              ),
              accountName: Text(
                "Hassan Younas",
              ),
              accountEmail: Text("FA18-BCS-036-A"),
            ),
          ],
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 80),
          child: Column(
            children: [
              Text(
                "Select An option",
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              Aplphabet("A".codeUnitAt(0), "Z".codeUnitAt(0))));
                },
                child: Text(
                  "1. Capital A-Z",
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              Aplphabet("a".codeUnitAt(0), "z".codeUnitAt(0))));
                },
                child: Text(
                  "2. Small a-z",
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
