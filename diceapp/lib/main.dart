import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: DiceApp(),
  ));
}

class DiceApp extends StatefulWidget {
  const DiceApp({Key? key}) : super(key: key);

  @override
  _DiceAppState createState() => _DiceAppState();
}

class _DiceAppState extends State<DiceApp> {
  int player1 = 0;
  int player2 = 0;
  int player3 = 0;
  int player4 = 0;
  int turn = 1;
  int p1img = 2;
  int p2img = 3;
  int p3img = 1;
  int p4img = 4;
  int count = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dice App"),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.blueAccent[250],
        ),
        child: Column(
          children: [
            // Topp Players Row
            Padding(
              padding: const EdgeInsets.only(top: 25, left: 10),
              child: Row(
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          Column(
                            children: [
                              const Text(
                                "Player 1",
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Score: ${player1}",
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              // Red Box
                              Container(
                                  margin: const EdgeInsets.only(
                                    left: 5,
                                  ),
                                  height: 70.0,
                                  width: 70.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                      color: turn == 1
                                          ? Colors.red.shade900
                                          : Colors.grey,
                                      width: 7,
                                    ),
                                  ),
                                  child: GestureDetector(
                                    child: Expanded(
                                      child: Image(
                                        image:
                                            AssetImage("images/face$p1img.png"),
                                      ),
                                    ),
                                    onTap: () {
                                      if (turn == 1) {
                                        int img = Random().nextInt(5) + 1;
                                        p1img = img;
                                        player1 += img;
                                        turn++;
                                        setState(() {});
                                      }
                                    },
                                  )
                                  //Red Box End
                                  ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 100.0,
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Column(
                            children: [
                              const Text(
                                "Player 2",
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Score: ${player2}",
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              // Red Box
                              Container(
                                  margin: const EdgeInsets.only(
                                    left: 5,
                                  ),
                                  height: 70.0,
                                  width: 70.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                      color: turn == 2
                                          ? Colors.blue.shade900
                                          : Colors.grey,
                                      width: 7,
                                    ),
                                  ),
                                  child: GestureDetector(
                                    child: Expanded(
                                      child: Image(
                                        image: AssetImage(
                                          "images/face$p2img.png",
                                        ),
                                      ),
                                    ),
                                    onTap: () {
                                      if (turn == 2) {
                                        int img = Random().nextInt(5) + 1;
                                        p2img = img;
                                        player2 += img;
                                        turn++;
                                        setState(() {});
                                      }
                                    },
                                  )
                                  //Red Box End
                                  ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            //Dice

            //Down Players Row
            Padding(
              padding: const EdgeInsets.only(top: 470, left: 10),
              child: Row(
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          Column(
                            children: [
                              const Text(
                                "Player 3",
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Score: ${player3}",
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              // Red Box
                              Container(
                                  margin: const EdgeInsets.only(
                                    left: 5,
                                  ),
                                  height: 70.0,
                                  width: 70.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                      color: turn == 3
                                          ? Colors.green.shade900
                                          : Colors.grey,
                                      width: 7,
                                    ),
                                  ),
                                  child: GestureDetector(
                                    child: Expanded(
                                      child: Image(
                                        image: AssetImage(
                                          "images/face$p3img.png",
                                        ),
                                      ),
                                    ),
                                    onTap: () {
                                      if (turn == 3) {
                                        int img = Random().nextInt(5) + 1;
                                        p3img = img;
                                        player3 += img;
                                        turn++;
                                        setState(() {});
                                      }
                                    },
                                  )
                                  //Red Box End
                                  ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 100.0,
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Column(
                            children: [
                              const Text(
                                "Player 4",
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Score: ${player4}",
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              // Red Box
                              Container(
                                  margin: const EdgeInsets.only(
                                    left: 5,
                                  ),
                                  height: 70.0,
                                  width: 70.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                      color: turn == 4
                                          ? Colors.yellow.shade900
                                          : Colors.grey,
                                      width: 7,
                                    ),
                                  ),
                                  child: GestureDetector(
                                    child: Expanded(
                                      child: Image(
                                        image: AssetImage(
                                          "images/face$p4img.png",
                                        ),
                                      ),
                                    ),
                                    onTap: () {
                                      if (turn == 4 && count < 2) {
                                        int img = Random().nextInt(5) + 1;
                                        p4img = img;
                                        player4 += img;
                                        turn = 1;
                                        count++;
                                        setState(() {});
                                      } else {
                                        int winner = 1;
                                        int score = player1;
                                        if (score < player2) {
                                          score = player2;
                                          winner++;
                                        }
                                        if (score < player3) {
                                          score = player3;
                                          winner++;
                                        }
                                        if (score < player4) {
                                          score = player4;
                                          winner++;
                                        }
                                        showDialog(
                                            context: context,
                                            builder: (BuildContext context) =>
                                                AlertDialog(
                                                  title: const Text("Winner"),
                                                  content: Text(
                                                      "Player $winner is the Winner with Score $score"),
                                                  actions: [
                                                    FlatButton(
                                                      // FlatButton widget is used to make a text to work like a button
                                                      textColor: Colors.black,
                                                      onPressed: () {
                                                        player1 = player2 =
                                                            player3 =
                                                                player4 = 0;
                                                        turn = 1;
                                                        Navigator.pop(context);
                                                        setState(() {});
                                                      }, // function used to perform after pressing the button
                                                      child: const Text(
                                                          'Play Again'),
                                                    ),
                                                  ],
                                                ));
                                      }
                                    },
                                  )
                                  //Red Box End
                                  ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
