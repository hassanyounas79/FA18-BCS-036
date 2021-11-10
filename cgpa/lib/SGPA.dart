// ignore_for_file: file_names, prefer_const_constructors, unnecessary_this
import 'package:flutter/material.dart';

class SGPA extends StatefulWidget {
  @override
  State<SGPA> createState() => _SGPAState();
}

class _SGPAState extends State<SGPA> {
  int courses = 1;
  List<double> sgpa = [];
  int prev = 0;
  double hex = 0xf1f2f3;
  double calculate() {
    double sum = 0.0;
    for (var abc in sgpa) {
      sum += abc;
    }
    return sum / courses;
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
                        height: 80,
                        child: Container(
                          padding: EdgeInsets.only(left: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Course: ${index + 1}",
                                  style: TextStyle(fontSize: 18)),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Slider(
                                      value: sgpa[index],
                                      min: 0,
                                      max: 4,
                                      activeColor: Colors.indigoAccent,
                                      divisions: 40,
                                      onChanged: (d) {
                                        setState(() {
                                          sgpa[index] = d;
                                        });
                                      }),
                                  Text(
                                    "${sgpa[index]}",
                                    style: TextStyle(fontSize: 20),
                                  )
                                ],
                              )
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
