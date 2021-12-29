// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

void main() {
  runApp(const Validator());
}

class Validator extends StatefulWidget {
  const Validator({Key? key}) : super(key: key);

  @override
  _ValidatorState createState() => _ValidatorState();
}

class _ValidatorState extends State<Validator> {
  void dispDilog(String str, IconData id, Color clr) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Result"),
            content: Center(
              child: ListView(
                children: [
                  Icon(
                    id,
                    color: clr,
                  ),
                  Text(str),
                ],
              ),
            ),
          );
        });
  }

  bool validate(String str) {
    var urlPattern =
        r"(https?|http)://([-A-Z0-9.]+)(/[-A-Z0-9+&@#/%=~_|!:,.;]*)?(\?[A-Z0-9+&@#/%=~_|!:‌​,.;]*)?";
    var match = RegExp(urlPattern, caseSensitive: false).hasMatch(str);

    return match;
  }

  final key = GlobalKey<FormState>();
  String url = "";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          centerTitle: true,
          title: Text("Url Validator"),
        ),
        body: Center(
          child: Card(
            elevation: 10,
            child: Container(
              height: 250,
              width: MediaQuery.of(context).size.width - 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Form(
                  key: key,
                  child: Column(
                    children: [
                      Center(
                        child: Text(
                          "URL Validator",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      TextFormField(
                        onSaved: (str) {
                          url = str ?? "";
                        },
                        validator: (str) {},
                        decoration: InputDecoration(
                          label: Text("URL"),
                          alignLabelWithHint: true,
                          hintText: "Enter any Any URL",
                          border: OutlineInputBorder(),
                        ),
                      ),
                      Center(
                        child: ElevatedButton(
                          onPressed: () {
                            var state = key.currentState;
                            state!.save();
                            if (validate(url)) {
                              dispDilog("Entered URL is Valid URL",
                                  FontAwesome.check_circle, Colors.green);
                            } else {
                              dispDilog("Entered URL is not a Valid URL",
                                  FontAwesome.times, Colors.red);
                            }
                          },
                          child: Text("Validate"),
                        ),
                      )
                    ],
                  )),
            ),
          ),
        ),
      ),
    );
  }
}
