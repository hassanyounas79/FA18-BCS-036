// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';

class GPA extends StatefulWidget {
  @override
  State<GPA> createState() => _GPAState();
}

class _GPAState extends State<GPA> {
  bool lab = false;
  int theory = 10;
  int labMarks = 10;
  int credit = 3;
  double gp = 0.0;
  String getGrade(int GPA) {
    if (GPA >= 90) {
      gp = 4.0;
      return "A";
    }
    if (GPA >= 85 && GPA < 90) {
      gp = 3.7;
      return "A-";
    }
    if (GPA >= 80 && GPA < 85) {
      gp = 3.3;
      return "B+";
    }
    if (GPA >= 75 && GPA < 80) {
      gp = 3.0;
      return "B";
    }
    if (GPA >= 70 && GPA < 75) {
      gp = 2.7;
      return "B-";
    }
    if (GPA >= 65 && GPA < 70) {
      gp = 2.3;
      return "C+";
    }
    if (GPA >= 60 && GPA < 65) {
      gp = 2.0;
      return "C";
    }
    if (GPA >= 55 && GPA < 60) {
      gp = 1.7;
      return "C-";
    }
    if (GPA >= 50 && GPA < 55) {
      gp = 1.3;
      return "D";
    } else {
      gp = 0;
      return "F";
    }
  }

  String grade = "";
  void dialog() {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text("Course GPA"),
              actionsAlignment: MainAxisAlignment.center,
              actions: [
                Text(
                  "Your Grade : $grade",
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  "Your GPA : ${gp.toStringAsFixed(2)}",
                  style: TextStyle(fontSize: 20),
                )
              ],
            ));
  }

  void calculate() {
    int t;
    int GPA;
    if (lab) {
      if (labMarks > 49) {
        t = theory * (credit - 1);
        GPA = t + labMarks;
        GPA = (GPA / credit).round();
        grade = getGrade(GPA);
        dialog();
      } else {
        grade = "F";
        gp = 0.0;
        dialog();
      }
    } else {
      GPA = theory;
      grade = getGrade(GPA);
      dialog();
    }
  }

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
        MaterialState.selected,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Colors.black;
    }

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("GPA Calculator"),
          centerTitle: true,
        ),
        body: Container(
          padding: EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Do you have lab in this course?",
                    style: TextStyle(fontSize: 20),
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: lab,
                        fillColor: MaterialStateProperty.resolveWith(getColor),
                        checkColor: Colors.white,
                        onChanged: (bool? abc) {
                          setState(() {
                            lab = abc!;
                          });
                        },
                      ),
                      Text("Yes"),
                    ],
                  ),
                ],
              )),
              Expanded(
                child: Column(
                  children: [
                    Text(
                      "Credit Hour",
                      style: TextStyle(fontSize: 24),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Slider(
                            min: 1,
                            max: 4,
                            activeColor: Colors.red,
                            value: credit.toDouble(),
                            onChanged: (double? abc) {
                              setState(() {
                                credit = abc!.round();
                              });
                            }),
                        Text(
                          "$credit",
                          style: TextStyle(fontSize: 40),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Text(
                      "Theory Marks",
                      style: TextStyle(fontSize: 24),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Slider(
                            min: 0,
                            max: 100,
                            value: theory.toDouble(),
                            onChanged: (double? abc) {
                              setState(() {
                                theory = abc!.round();
                              });
                            }),
                        Text(
                          "$theory",
                          style: TextStyle(fontSize: 40),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              lab
                  ? Expanded(
                      child: Column(
                        children: [
                          Text(
                            "Lab Marks",
                            style: TextStyle(fontSize: 24),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Slider(
                                  min: 0,
                                  max: 100,
                                  activeColor: Colors.deepOrange,
                                  value: labMarks.toDouble(),
                                  onChanged: (double? abc) {
                                    setState(() {
                                      labMarks = abc!.round();
                                    });
                                  }),
                              Text(
                                "$labMarks",
                                style: TextStyle(fontSize: 40),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  : Text(""),
              ElevatedButton(
                  onPressed: () {
                    calculate();
                  },
                  child: Text("Calculate"))
            ],
          ),
        ),
      ),
    );
  }
}
