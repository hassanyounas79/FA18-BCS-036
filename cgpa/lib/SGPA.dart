// ignore_for_file: file_names, prefer_const_constructors, unnecessary_this
import 'package:flutter/material.dart';

class SGPA extends StatefulWidget {
  @override
  State<SGPA> createState() => _SGPAState();
}

class _SGPAState extends State<SGPA> {
  int courses = 1;
  List<double> sgpa = [];
  List<int> credit = [];
  int prev = 0;
  double hex = 0xf1f2f3;
  double calculate() {
    double sum = 0.0;
    int hour = 0;
    List<double> temp = [];
    for (var abc in credit) {
      hour += abc;
    }
    for (int a = 0; a < credit.length; a++) {
      temp.add(sgpa[a] * credit[a]);
    }
    for (var item in temp) {
      sum += item;
    }

    return sum / hour;
  }

  void dispDialog() {
    showDialog(
        context: context,
        builder: (abc) => AlertDialog(
              title: Text("SGPA"),
              actionsAlignment: MainAxisAlignment.center,
              actions: [
                Text(
                  "Your Semester GPA is: ${calculate().toStringAsFixed(2)}",
                  style: TextStyle(fontSize: 18),
                )
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    if (prev != courses) {
      prev = courses;
      sgpa = List.generate(courses, (index) => 0.0);
      credit = List.generate(courses, (index) => 1);
    }
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("SGPA Calculator"),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Select Courses", style: TextStyle(fontSize: 25)),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Slider(
                        value: courses.toDouble(),
                        min: 1,
                        max: 6,
                        onChanged: (abc) {
                          setState(() {
                            courses = abc.round();
                          });
                        }),
                    Text(
                      "${courses}",
                      style: TextStyle(fontSize: 20),
                    )
                  ],
                ),
              ],
            ),
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width - 50,
                child: ListView.builder(
                    itemCount: courses,
                    itemBuilder: (context, index) {
                      hex += 9;
                      return Container(
                        margin: EdgeInsets.only(top: 15),
                        color: Colors.blueAccent[100],
                        height: 140,
                        child: Container(
                          padding: EdgeInsets.only(left: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Course: ${index + 1}",
                                  style: TextStyle(fontSize: 18)),
                              Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: const [
                                        Text(
                                          "Credit",
                                          style: TextStyle(fontSize: 20),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Text(
                                          "G.P",
                                          style: TextStyle(fontSize: 20),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      children: [
                                        Slider(
                                            value: credit[index].toDouble(),
                                            min: 1,
                                            max: 4,
                                            activeColor: Colors.orange,
                                            // divisions: 4,
                                            onChanged: (d) {
                                              setState(() {
                                                credit[index] = d.round();
                                              });
                                            }),
                                        Slider(
                                            value: sgpa[index],
                                            min: 0,
                                            max: 4,
                                            activeColor: Colors.red,
                                            divisions: 40,
                                            onChanged: (d) {
                                              setState(() {
                                                sgpa[index] = d;
                                              });
                                            }),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      children: [
                                        Text(
                                          "${credit[index]}",
                                          style: TextStyle(fontSize: 20),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Text(
                                          "${sgpa[index]}",
                                          style: TextStyle(fontSize: 20),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  dispDialog();
                },
                child: Text("Calculate SGPA"))
          ],
        ),
      ),
    );
  }
}
