// ignore_for_file: unused_local_variable, duplicate_ignore

import 'package:flutter/material.dart';

class TicTacToe extends StatefulWidget {
  const TicTacToe({super.key});

  @override
  State<TicTacToe> createState() => _TicTacToeState();
}

class _TicTacToeState extends State<TicTacToe> {
  final List<String> bord = List.filled(9, "");
  String covariantPlayer = "X";
  String winner = "";
  bool isTis = false;

// ignore: non_constant_identifier_names
  Player(int index) {
    if (winner != "" || bord[index] != "") {
      return;
    }
    setState(() {
      bord[index] = covariantPlayer;
      covariantPlayer = covariantPlayer == "X" ? "O" : "X";
      CheckForWinner();
// ignore: unused_local_variable
      List<List<int>> lines = [
        [0, 1, 2],
        [3, 4, 5],
        [6, 7, 8],
        [0, 3, 6],
        [1, 4, 7],
        [2, 5, 8],
        [0, 4, 8],
        [2, 4, 6],
      ];

// ignore: unused_local_variable
      for (List<int> line in lines) {
        // ignore: unused_local_variable, non_constant_identifier_names
        String Player1 = bord[line[0]];
        // ignore: unused_local_variable, non_constant_identifier_names
        String Player2 = bord[line[1]];
        // ignore: non_constant_identifier_names, unused_local_variable
        String Player3 = bord[line[2]];
        if (Player1 == "" || Player2 == "" || Player3 == "") {
          continue;
        }
        if (Player1 == Player2 && Player2 == Player3) {
          setState(() {
            winner = Player1;
          });
          return;
        }
      }
      if (!bord.contains("")) {
        setState(() {
          isTis = true;
        });
      }
    });
  }

// ignore: non_constant_identifier_names
  CheckForWinner() {
    List<List<int>> lines = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6],
    ];

// ignore: unused_local_variable
    for (List<int> line in lines) {
      // ignore: unused_local_variable, non_constant_identifier_names
      String Player1 = bord[line[0]];
      // ignore: unused_local_variable, non_constant_identifier_names
      String Player2 = bord[line[1]];
      // ignore: non_constant_identifier_names, unused_local_variable
      String Player3 = bord[line[2]];
      if (Player1 == "" || Player2 == "" || Player3 == "") {
        continue;
      }
      if (Player1 == Player2 && Player2 == Player3) {
        setState(() {
          winner = Player1;
        });
        return;
      }
    }
    if (!bord.contains("")) {
      setState(() {
        isTis = true;
      });
    }
  }

  resetGame() {
    setState(() {
      bord.fillRange(0, 9, "");
      covariantPlayer = "X";
      winner = "";
      isTis = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    // ignore: duplicate_ignore
    // ignore: unused_local_variable
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // DisPlaying the Players
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: covariantPlayer == "X"
                        ? Colors.amber
                        : Colors.transparent,
                  ),
                  boxShadow: const [
                    BoxShadow(color: Colors.black38, blurRadius: 3),
                  ],
                ),
                child: const Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Icon(
                        Icons.person,
                        size: 30,
                        color: Colors.white,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Abdallah",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "X",
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: size.width * 0.08,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: covariantPlayer == "O"
                        ? Colors.amber
                        : Colors.transparent,
                  ),
                  boxShadow: const [
                    BoxShadow(color: Colors.black38, blurRadius: 3),
                  ],
                ),
                child: const Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Icon(
                        Icons.person,
                        size: 30,
                        color: Colors.white,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "BOT 2",
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "O",
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: size.height * 0.04,
          ),
          if (winner != "")
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  winner,
                  style: const TextStyle(
                    fontSize: 35,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  " WON!",
                  style: TextStyle(
                    fontSize: 35,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          if (isTis)
            const Text(
              "it's a Tie!",
              style: TextStyle(
                fontSize: 30,
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),

          Padding(
            padding: const EdgeInsets.all(10),
            child: GridView.builder(
              itemCount: 9,
              padding: const EdgeInsets.all(10),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Player(index);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black38,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        bord[index],
                        style:
                            const TextStyle(fontSize: 50, color: Colors.white),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          if (winner != "" || isTis)
            ElevatedButton(
                onPressed: resetGame,
                child: const Text(
                  "Play Again",
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                   
                  ),
                ))
        ],
      ),
    );
  }
}
