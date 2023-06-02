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
                    Text("Nº of die faces:",style: TextStyle(fontSize: 25,color: Colors.grey[400])),
                    Divider(height: 20),
                    DropdownButton<int>(
                      dropdownColor: Colors.grey[800],
                      style: TextStyle(color: Colors.grey[400],fontSize: 25),
                      borderRadius: BorderRadius.circular(30),
                      value: _selectedDice,
                      items: [4, 6, 8, 12, 20].map<DropdownMenuItem<int>>((int value) {
                        return DropdownMenuItem<int>(
                          value: value,
                          child: Text('$value faces'),
                        );
                      }).toList(),
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("Nº of dice:",style: TextStyle(fontSize: 25,color: Colors.grey[400])),
                    Divider(height: 25,color: Colors.grey[800]),
                    TextFormField(
                      style: TextStyle(
                         fontSize: 25 ,
                        color: Colors.grey[400]
                      ),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(5),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.grey[400]!),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.grey.shade200),
                        ),
                      ),
                      textAlign: TextAlign.center,
                      initialValue: '0',
                      keyboardType: TextInputType.number,
                      onChanged: (String newValue) {
                        setState(() {
                          _diceCount = int.tryParse(newValue) ?? 1;
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