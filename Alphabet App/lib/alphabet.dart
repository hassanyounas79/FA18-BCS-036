// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class Aplphabet extends StatefulWidget {
  int s;
  int e;
  // const Aplphabet({Key? key}) : super(key: key);
  Aplphabet(this.s, this.e);

  @override
  _AplphabetState createState() => _AplphabetState(this.s, this.e);
}

class _AplphabetState extends State<Aplphabet> {
  _AplphabetState(this.char_s, this.char_e) {
    a = this.char_s;
    b = this.char_e;
  }
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

  int a = 1;
  int b = 2;
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
            Container(
              height: 300,
              child: Center(
                  child: Text(
                String.fromCharCode(char_s),
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 90,
                ),
              )),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    time?.cancel();
                    sec = 5;
                    first = true;

                    setState(() {
                      if (char_s > this.a) {
                        char_s--;
                      }
                    });
                  },
                  child: Text("BackWard"),
                ),
                ElevatedButton(
                  onPressed: () {
                    time?.cancel();
                    sec = 5;
                    first = true;
                    if (char_s < this.char_e) char_s++;
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
