// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:app1/alphabet.dart';
import 'package:app1/splash.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

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
              ListTile(
                leading: Icon(Icons.arrow_right),
                title: Text("Capital A-Z"),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              Aplphabet("A".codeUnitAt(0), "Z".codeUnitAt(0))));
                },
              ),
              ListTile(
                leading: Icon(Icons.arrow_right),
                title: Text("Small a-z"),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) =>
                              Aplphabet("a".codeUnitAt(0), "z".codeUnitAt(0))));
                },
              ),
            ],
          ),
        ),
        body: Center(
          child: DefaultTextStyle(
            style: const TextStyle(
              fontSize: 50.0,
              color: Colors.blue,
            ),
            child: AnimatedTextKit(
              repeatForever: true,
              animatedTexts: [
                WavyAnimatedText('Learn Alphabets'),
              ],
              isRepeatingAnimation: true,
            ),
          ),
        ));
  }
}
