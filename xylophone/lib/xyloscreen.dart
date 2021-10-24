import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:xylophone/item.dart';

class xylo extends StatefulWidget {
  var list2;
  // const xylo({Key? key, var list}) : super(key: key);

  @override
  _xyloState createState() {
    _xyloState a = _xyloState();
    a.list = list2;
    return a;
  }

  xylo(var list1) {
    list2 = list1;
  }
}

class _xyloState extends State<xylo> {
  var list;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Xylophone App"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: 2,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              AudioPlayer audioPlayer = AudioPlayer();
              playLocal() async {
                int result = await audioPlayer.play(
                    "/data/user/0/com.example.xylophone/cache/file_picker/note1.wav",
                    isLocal: true);
              }

              playLocal();
            },
            child: Container(
              margin: const EdgeInsets.only(top: 5, left: 10, right: 10),
              height: 80,
              width: MediaQuery.of(context).size.width - 20,
              color: Colors.red,
            ),
          );
        },
      ),
    );
  }
}
