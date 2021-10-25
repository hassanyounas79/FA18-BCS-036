// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:xylophone/main.dart';

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
          return GestureDetector(
            onTap: () {
              AudioPlayer audioPlayer = AudioPlayer();
              playLocal() async {
                int result =
                    await audioPlayer.play(list[index].path, isLocal: true);
              }

              playLocal();
            },
            child: Container(
              margin: const EdgeInsets.only(top: 5, left: 10, right: 10),
              height: 80,
              width: MediaQuery.of(context).size.width - 20,
              color: list[index].clr,
            ),
          );
        },
      ),
    );
  }
}
