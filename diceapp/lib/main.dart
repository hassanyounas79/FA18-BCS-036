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
  int img = 1;
  int count = 0;
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
          color: Colors.blueAccent[300],
        ),
        child: Column(
          children: [
            // Topp Players Row
            Padding(
              padding: const EdgeInsets.only(top: 30, left: 10),
              child: Row(
                children: [
                  Column(
                    children: [
                      const Text(
                        "Player 1",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Score: ${player1}",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 180.0,
                  ),
                  Column(
                    children: [
                      Text(
                        "Player 2",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Score: ${player2}",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            //Dice
            Padding(
              padding: const EdgeInsets.all(150.0),
              child: Center(
                child: GestureDetector(
                    onTap: () {
                      img = Random().nextInt(6) + 1;
                      if (turn == 1) {
                        player1 = player1 + img;
                        turn++;
                      } else if (turn == 2) {
                        player2 = player2 + img;
                        turn++;
                      } else if (turn == 3) {
                        player3 = player3 + img;
                        turn++;
                      } else {
                        player4 = player4 + img;
                        turn = 1;
                        count++;
                      }
                      int win = 1;
                      if (count <= 1) {
                        var list = [];
                        list.add(player1);
                        list.add(player2);
                        list.add(player3);
                        list.add(player4);
                        int large = player1;
                        for (int i = 1; i < 4; i++) {
                          if (large > list[i]) {
                            large = list[i];
                            win = i;
                          }
                        }

                        AlertDialog(
                          title: Text("Winner"),
                          content: Text("Player ${win} is the Winner"),
                        );
                        player1 = 0;
                        player2 = 0;
                        player3 = 0;
                        player4 = 0;
                        turn = 1;
                      }

                      setState(() {});
                    },
                    child: Image.asset('images/face${img}.png')),
              ),
            ),
            //Down Players Row
            Padding(
              padding: EdgeInsets.only(top: 80, left: 10),
              child: Row(
                children: [
                  Column(
                    children: [
                      const Text(
                        "Player 3",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Score: ${player3}",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 180.0,
                  ),
                  Column(
                    children: [
                      const Text(
                        "Player 4",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Score: ${player4}",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
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
