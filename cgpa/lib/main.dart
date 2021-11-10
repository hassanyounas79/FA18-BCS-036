// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'package:cgpa/GPA.dart';
import 'package:cgpa/splash.dart';
import 'package:flutter/material.dart';
import 'CGPA.dart';
import 'SGPA.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

main() {
  runApp(MaterialApp(home: Splash()));
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
        body: Center(
          child: DefaultTextStyle(
            style: const TextStyle(
              fontSize: 70.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'Canterbury',
              color: Colors.deepOrangeAccent,
            ),
            child: AnimatedTextKit(
              isRepeatingAnimation: true,
              repeatForever: true,
              animatedTexts: [
                ScaleAnimatedText('Think'),
                ScaleAnimatedText('Calculate'),
                ScaleAnimatedText('And'),
                ScaleAnimatedText('Do'),
                ScaleAnimatedText('Hardwork'),
              ],
              onTap: () {},
            ),
          ),
        ),
      ),
    );
  }
}
