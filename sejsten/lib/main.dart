import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Seksten',
      home: MyCustomForm(),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({Key? key}) : super(key: key);

  @override
  _MyCustomFormState createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {
  final myController = TextEditingController();
  List<String> playerList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      appBar: AppBar(
        title: const Text(
          'Seksten',
          style: TextStyle(fontSize: 32.0, color: Colors.yellow),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          const Center(
            child: Text(
              'Lobby',
              style: TextStyle(
                fontSize: 32.0,
                fontWeight: FontWeight.w500,
                color: Colors.yellow,
                letterSpacing: 1.4,
              ),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              height: 300.0,
              width: 400.0,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.yellow,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  playerList.join("\n"),
                  style: const TextStyle(fontSize: 22.0, color: Colors.yellow),
                ),
              ),
            ),
          ),
          TextField(
            style: TextStyle(color: Colors.yellow),
            textAlign: TextAlign.center,
            decoration: const InputDecoration(
                hintText: 'Tilføj spiller',
                hintStyle: TextStyle(color: Color.fromARGB(255, 255, 255, 1))),
            controller: myController,
          ),
          SizedBox(
            height: 100.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 50.0,
                  width: 120.0,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0)),
                      ),
                    ),
                    child: const Text(
                      'Indsæt',
                      style: TextStyle(fontSize: 26.0, color: Colors.yellow),
                    ),
                    onPressed: () {
                      playerList.add(myController.text);
                      myController.clear();
                      print(playerList);
                      setState(() {});
                    },
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 50.0,
                width: 120.0,
                child: ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                    ),
                  ),
                  child: const Text(
                    'Start',
                    style: TextStyle(fontSize: 26.0, color: Colors.yellow),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const game()),
                    );
                  },
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class game extends StatefulWidget {
  const game({Key? key}) : super(key: key);

  @override
  _gameState createState() => _gameState();
}

int diceVal = 0;
int dice = 0;
int sum = 0;
List<int> listOfNumbers = [];

class _gameState extends State<game> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      appBar: AppBar(
        title: const Text('Seksten'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Text(
              'Tenings total værdi',
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.white,
              ),
            ),
            Text(
              sum.toString(),
              style: const TextStyle(
                fontSize: 70.0,
                color: Colors.yellow,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 100),
              color: Colors.lightBlue,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    dice.toString(),
                    style: const TextStyle(
                        fontSize: 70.0,
                        color: Colors.yellow,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Center(
                child: Container(
                    padding: const EdgeInsets.all(0.0),
                    color: Colors.lightBlue,
                    width: 300.0,
                    height: 50.0,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          ),
                        ),
                      ),
                      child: const Text(
                        '🎲',
                        style: TextStyle(fontSize: 26.0),
                      ),
                      onPressed: () {
                        randomNumber();
                        setState(() {});
                      },
                    )))
          ],
        ),
      ),
    );
  }
}

void randomNumber() {
  var random = new Random();
  dice = random.nextInt(7);
  if (dice == 0) {
    dice = 1;
  }
  listOfNumbers.add(dice);
  sum = listOfNumbers.reduce((x, y) => x + y);
}

void addPlayer() {}

class Player {
  final String name;
  Player({required this.name});
}
