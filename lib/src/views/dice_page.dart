import 'dart:math';

import 'package:flutter/material.dart';

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int _selectedDice = 4;
  int _diceCount = 1;
  int _result = 0;

  void _rollDice() {
    int sum = 0;
    for (int i = 0; i < _diceCount; i++) {
      sum += Random().nextInt(_selectedDice) + 1;
    }
    setState(() {
      _result = sum;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Scaffold(
        backgroundColor: Colors.grey[400],
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.grey[800],
            size: 30,
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_rounded), // Icono a mostrar
            onPressed: () {
              Navigator.popAndPushNamed(context, '/home');
            },
          ),
          centerTitle: true,
          elevation: 0,
          title: Text('Dices',style: TextStyle(fontSize: 30,color: Colors.grey[800])),
          backgroundColor: Colors.grey.shade400,
        ),
        body: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.all(20),
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  color: Colors.grey[800]
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("Num of die faces:",style: TextStyle(fontSize: 25,color: Colors.grey[400])),
                    Divider(height: 20),
                    DropdownButton<int>(
                      dropdownColor: Colors.grey[800],
                      style: TextStyle(color: Colors.grey[400], fontSize: 20),
                      borderRadius: BorderRadius.circular(30),
                      value: _selectedDice,
                      items: [
                        4, 6, 8, 10, 12, 20
                      ].map<DropdownMenuItem<int>>(
                            (int value) {
                          List<int> diceValues;
                          switch (value) {
                            case 4:
                              diceValues = List.generate(4, (index) => index + 1);
                              break;
                            case 6:
                              diceValues = List.generate(6, (index) => index + 1);
                              break;
                            case 8:
                              diceValues = List.generate(8, (index) => index + 1);
                              break;
                            case 10:
                              diceValues = List.generate(10, (index) => (index + 1) * 10);
                              break;
                            case 12:
                              diceValues = List.generate(12, (index) => index + 1);
                              break;
                            case 20:
                              diceValues = List.generate(20, (index) => index + 1);
                              break;
                            default:
                              diceValues = List.generate(4, (index) => index + 1);
                          }

                          return DropdownMenuItem<int>(
                            value: value,
                            child: Text('D$value'),
                          );
                        },
                      ).toList(),
                      onChanged: (int? newValue) {
                        setState(() {
                          _selectedDice = newValue ?? 4;
                        });
                      },
                    ),

                  ],
                )
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.all(20),
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    color: Colors.grey[800]),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("Num of dice:",style: TextStyle(fontSize: 25,color: Colors.grey[400])),
                    Divider(height: 25,color: Colors.grey[800]),
                    DropdownButton<int>(
                      dropdownColor: Colors.grey[800],
                      style: TextStyle(fontSize: 25, color: Colors.grey[400]),
                      borderRadius: BorderRadius.circular(10),
                      value: _diceCount,
                      items: List<DropdownMenuItem<int>>.generate(11, (int index) {
                        return DropdownMenuItem<int>(
                          value: index,
                          child: Text(index.toString()),
                        );
                      }),
                      onChanged: (int? newValue) {
                        setState(() {
                          _diceCount = newValue ?? 0;
                        });
                      },
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.all(20),
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    color: Colors.grey[800]),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.grey.shade900),
                        shape:  MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                      onPressed: _rollDice,
                      child: Text('Roll ',style: TextStyle(fontSize: 25,color: Colors.grey[400])),
                    ),
                    Text('Result:    $_result',style: TextStyle(fontSize: 25,color: Colors.grey[400])),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
