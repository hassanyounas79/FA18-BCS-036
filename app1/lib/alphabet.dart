// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:async';
import 'package:flutter/material.dart';

class Aplphabet extends StatefulWidget {
  int s;
  int e;
  // const Aplphabet({Key? key}) : super(key: key);
  Aplphabet(this.s, this.e);

  @override
  _AplphabetState createState() => _AplphabetState(this.s, this.e);
}

class _AplphabetState extends State<Aplphabet> {
  _AplphabetState(this.char_s, this.char_e);
  int sec = 5;
  bool first = false;
  Timer? time;
  _startTimer() {
    time = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (sec > 1) {
          sec--;
        } else {
          sec = 5;
          timer.cancel();
          first = true;
          if (char_s < char_e) char_s++;
        }
      });
    });
  }

  int char_s;
  int char_e;

  @override
  Widget build(BuildContext context) {
    if (first) {
      first = false;
      _startTimer();
    }
    return (Scaffold(
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
      backgroundColor: Colors.blue[300],
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 20),
              child: Text(
                "$sec",
                style: const TextStyle(
                  fontSize: 40,
                ),
              ),
            ),
            Center(
              child: Text(
                String.fromCharCode(char_s),
                style: TextStyle(fontSize: 60),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    time?.cancel();
                    sec = 5;
                    first = true;
                    if (char_s > "a".codeUnitAt(0)) char_s--;
                    setState(() {});
                  },
                  child: Text("BackWard"),
                ),
                ElevatedButton(
                  onPressed: () {
                    time?.cancel();
                    sec = 5;
                    first = true;
                    if (char_s < char_e) char_s++;
                    setState(() {});
                  },
                  child: Text("Forward"),
                ),
              ],
            ),
            SizedBox(
              height: 60,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      first = true;
                      sec = 5;
                    });
                  },
                  child: Text("Start"),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      time?.cancel();
                      first = false;
                      sec = 1;
                    });
                  },
                  child: Text("Stop"),
                ),
              ],
            )
          ],
        ),
      ),
    ));
  }
}
