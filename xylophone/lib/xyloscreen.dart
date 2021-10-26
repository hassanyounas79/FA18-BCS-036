// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

import 'item.dart';

class xylo extends StatefulWidget {
  var list2;
  //  const xylo({Key? key, var list}) : super(key: key);

  @override
  _xyloState createState() => _xyloState(list2);

  xylo(var list1) {
    list2 = list1;
  }
}

class _xyloState extends State<xylo> {
  var list = List.filled(1, items());
  _xyloState(var list1) {
    list = list1;
  }
  static double n = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Xylophone App"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: list.length,
        itemBuilder: (BuildContext context, int index) {
          n = n + 15;
          return GestureDetector(
            onTap: () {
              AudioPlayer audioPlayer = AudioPlayer();
              playLocal() async {
                int result =
                    await audioPlayer.play(list[index].path, isLocal: true);
              }

              playLocal();
            },
            child: Center(
              child: Container(
                margin: EdgeInsets.only(
                  top: 5,
                ),
                height: 80,
                width: MediaQuery.of(context).size.width - n,
                color: list[index].clr,
              ),
            ),
          );
        },
      ),
    );
  }
}
