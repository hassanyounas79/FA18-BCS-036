// ignore_for_file: file_names, prefer_const_constructors, unnecessary_this
import 'package:flutter/material.dart';

class CGPA extends StatefulWidget {
  @override
  State<CGPA> createState() => _CGPAState();
}

class _CGPAState extends State<CGPA> {
  int semester = 1;
  List<double> CGPA = [];
  int prev = 0;

  double calculate() {
    double sum = 0.0;
    for (var abc in CGPA) {
      sum += abc;
    }
    return sum / semester;
  }

  void dispDialog() {
    showDialog(
        context: context,
        builder: (abc) => AlertDialog(
              elevation: 1,
              title: Text("CGPA"),
              actionsAlignment: MainAxisAlignment.center,
              actions: [
                Text(
                  "Your CGPA is: ${calculate().toStringAsFixed(2)}",
                  style: TextStyle(fontSize: 18),
                )
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    if (prev != semester) {
      prev = semester;
      CGPA = List.generate(semester, (index) => 0.0);
    }
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("CGPA Calculator"),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child:
                      Text("Select semester", style: TextStyle(fontSize: 25)),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Slider(
                        value: semester.toDouble(),
                        min: 1,
                        max: 6,
                        onChanged: (abc) {
                          setState(() {
                            semester = abc.round();
                          });
                        }),
                    Text(
                      "${semester}",
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
                    itemCount: semester,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.only(top: 15),
                        color: Colors.blueAccent[100],
                        height: 80,
                        child: Container(
                          padding: EdgeInsets.only(left: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Semester: ${index + 1}",
                                  style: TextStyle(fontSize: 18)),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Slider(
                                      value: CGPA[index],
                                      min: 0,
                                      max: 4,
                                      activeColor: Colors.red[300],
                                      divisions: 40,
                                      onChanged: (d) {
                                        setState(() {
                                          CGPA[index] = d;
                                        });
                                      }),
                                  Text(
                                    "${CGPA[index]}",
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
                child: Text("Calculate CGPA"))
          ],
        ),
      ),
    );
  }
}
