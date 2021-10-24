// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import "package:flutter_colorpicker/flutter_colorpicker.dart";
import 'package:file_picker/file_picker.dart';
import 'package:xylophone/item.dart';
import 'package:xylophone/xyloscreen.dart';

void main() {
  var list;
  runApp(MaterialApp(home: xylo(list)));
}

class ScreenOne extends StatefulWidget {
  const ScreenOne({Key? key}) : super(key: key);

  @override
  _ScreenOneState createState() => _ScreenOneState();
}

class _ScreenOneState extends State<ScreenOne> {
  Color currentColor = Color(0xffffffff);
  Color pickerColor = Color(0xff443a49);
  String path = "";
  static int num = 1;
  var list = List.filled(num, items());
  void colordialog(int index) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Pick a color!'),
          content: SingleChildScrollView(
            child: ColorPicker(
              pickerColor: pickerColor,
              onColorChanged: (Color c) => {
                pickerColor = c,
              },
              showLabel: true,
              pickerAreaHeightPercent: 0.8,
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: const Text('Got it'),
              onPressed: () {
                list[index].clr = pickerColor;
                setState(() {});
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Xylophone App"),
        centerTitle: true,
      ),
      body: Container(
        color: currentColor,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: TextField(
                onChanged: (value) => {
                  num = value == "" ? 0 : int.parse(value),
                },
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  label: const Text("Enter a number"),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(50, 10, 50, 10),
              child: ElevatedButton(
                onPressed: () => {
                  //get the currnet focus node
                  if (!FocusScope.of(context).hasPrimaryFocus)
                    {
                      //prevent Flutter from throwing an exception
                      FocusScope.of(context)
                          .unfocus() //unfocust from current focust, so that keyboard will dismiss
                    },
                  setState(
                    () {},
                  ),
                },
                child: Text("Generate"),
              ),
            ),
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width - 80,
                child: ListView.builder(
                  itemCount: num,
                  itemBuilder: (context, index) {
                    return Container(
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        margin: EdgeInsets.only(
                          top: 30,
                        ),
                        child: Row(
                          children: [
                            GestureDetector(
                              // Color Dialog
                              onTap: () {
                                colordialog(index);
                              },
                              // Color Dialog
                              child: Container(
                                margin: EdgeInsets.only(
                                    left: 20, right: 20, top: 4, bottom: 4),
                                height: 40,
                                width: 85,
                                alignment: Alignment.center,
                                child: Text(
                                  "Pick Color",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                decoration: BoxDecoration(
                                  color: currentColor,
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                              ),
                            ),
                            GestureDetector(
                              // File Dialog
                              onTap: () async {
                                FilePickerResult? result =
                                    await FilePicker.platform.pickFiles();

                                if (result != null) {
                                  PlatformFile file = result.files.first;
                                  path = file.path.toString();
                                  list[index].path = path;
                                } else {
                                  // User canceled the picker
                                }
                              },
                              // File Dialog
                              child: Container(
                                margin: EdgeInsets.only(
                                    left: 20, right: 20, top: 4, bottom: 4),
                                height: 40,
                                width: 85,
                                alignment: Alignment.center,
                                child: Text(
                                  "Pick File",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                decoration: BoxDecoration(
                                  color: currentColor,
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                              ),
                            ),
                          ],
                        ));
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
