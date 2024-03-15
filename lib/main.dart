import 'dart:js_util';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static const String _title = 'Flutter Stateful Clicker Counter';
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.
  // This class is the configuration for the state.
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int _weight = 0;
  double _currentSliderValue = 0;
  TextEditingController _weightTEC = TextEditingController();

  Color titleBlue = Colors.blue;
  Color titlePink = Color(0xffe91e63);
  Color titleColor = Colors.blue;
  Color modalBottomSheetBlue = Color(0xff2196f3).withOpacity(0.7);
  Color modalBottomSheetpink = Color(0xffe91e63).withOpacity(0.7);
  Color modalButtomColor = Color(0xff2196f3).withOpacity(0.7);

  String male = "MALE";
  String female = "FEMALE";

  double _height = 0.0;
  double _heightInMeter = 0.0;
  double _heightInMeterSquare = 0.0;
  double _valueBMI = 0.0;

  String manImage = "images/man.jpg";
  String femanImage = "images/woman.jpg";
  String bgImage = "images/man.jpg";
  String _conditionCheckForBmi = "Incorrect Information";

  void _incrementCounter() {
    setState(() {
      if (male == "MALE") {
        titleColor = Colors.blue;
        bgImage = manImage;
        titlePink = Color(0xffe91e63).withOpacity(0.5);
        titleBlue = Colors.blue;
        modalButtomColor = modalBottomSheetBlue;
      } else {
        titleColor = Colors.pink;
        titlePink = Colors.pink;
        titleBlue = Color(0xff2196f3).withOpacity(0.5);
        bgImage = femanImage;
        modalButtomColor = modalBottomSheetpink;
      }
    });
  }

  void _incrementCounter1() {
    setState(() {
      if (female == "FEMALE") {
        titleColor = Colors.pink;
        titleBlue = Color(0xff2196f3).withOpacity(0.5);
        titlePink = Colors.pink;
        bgImage = femanImage;
        modalButtomColor = modalBottomSheetpink;
      } else {
        titleColor = Color(0xff2196f3);
        titleBlue = Colors.blue;
        titlePink = Color(0xffe91e63).withOpacity(0.5);
        bgImage = manImage;
        modalButtomColor = modalBottomSheetBlue;
      }
    });
  }

  void _incrementWeight() {
    setState(() {
      _counter++;
    });
  }

  void _resetButton() {
    setState(() {
      _counter = 0;
      _weightTEC.clear();
      _currentSliderValue = 0;
    });
  }

  void _decrementWeight() {
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        backgroundColor: titleColor,
        leading: Icon(Icons.fitness_center_outlined),
        title: const Text('Body Mass Index (BMI)'),
      ),
      body: Center(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(bgImage),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(23, 20, 15, 0),
            child: Container(
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        child: GestureDetector(
                          onTap: _incrementCounter,
                          child: Container(
                            height: 60,
                            width: 150,
                            color: titleBlue,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(13.0),
                                      child: Text(
                                        male,
                                        style: TextStyle(
                                            fontSize: 23,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Container(
                                      child: Icon(
                                        Icons.male,
                                        size: 35,
                                        color: Colors.white,
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Container(
                            child: GestureDetector(
                          onTap: _incrementCounter1,
                          child: Container(
                            height: 60,
                            width: 150,
                            color: titlePink,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Text(
                                        female,
                                        style: TextStyle(
                                            fontSize: 23,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Container(
                                      child: Icon(
                                        Icons.female,
                                        size: 35,
                                        color: Colors.white,
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        )),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Row(
                      children: [
                        Container(
                          height: 145,
                          width: 150,
                          color: Color(0xff000000).withOpacity(0.5),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Text(
                                  "AGE",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                              Text(
                                "$_counter",
                                style: TextStyle(
                                    fontSize: 40,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(15, 0, 05, 0),
                                    child: FloatingActionButton(
                                      onPressed: _incrementWeight,
                                      backgroundColor: titleColor,
                                      tooltip: 'Increment',
                                      child: Icon(
                                        Icons.add,
                                        size: 40,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(10, 0, 05, 0),
                                    child: FloatingActionButton(
                                      onPressed: _decrementWeight,
                                      backgroundColor: titleColor,
                                      tooltip: 'Decrement',
                                      child: Icon(
                                        Icons.remove,
                                        size: 40,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 12),
                          child: Container(
                            height: 145,
                            width: 155,
                            color: Color(0xff000000).withOpacity(0.5),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 4),
                                  child: Text(
                                    "WEIGHT(KG)",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ),
                                Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: TextField(
                                      controller: _weightTEC,
                                      textAlign: TextAlign.center,
                                      keyboardType: TextInputType.number,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 30,
                                          fontWeight: FontWeight
                                              .bold), // Set text color to white
                                      decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.white)),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 4, 0),
                    child: Container(
                      height: 120,
                      width: 320,
                      color: Color(0xff000000).withOpacity(0.5),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: Column(
                          children: [
                            Text(
                              "HEIGHT(cm)",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Slider(
                                value: _currentSliderValue,

                                max: 250,
                                divisions: 250,
                                activeColor:
                                    titleColor, // Set the color of the active (filled) part
                                inactiveColor: Colors.grey,
                                label: _currentSliderValue.round().toString(),
                                onChanged: (double value) {
                                  setState(() {
                                    _currentSliderValue = value;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: Container(
                            child: GestureDetector(
                              onTap: () {
                                _resetButton();
                              },
                              child: Row(
                                children: [
                                  Container(
                                    width: 60,
                                    height: 60,
                                    color: Colors.red,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Row(
                                        children: [
                                          Container(
                                            child: Tooltip(
                                              message: 'Restore',
                                              child: Icon(
                                                Icons.restore,
                                                size: 35,
                                                color: Colors.white,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15, left: 20),
                          child: Container(
                            child: GestureDetector(
                              onTap: () {
                                _weight = int.parse(_weightTEC.text);
                                _height = _currentSliderValue;
                                _heightInMeter = _height / 100;
                                _heightInMeterSquare =
                                    _heightInMeter * _heightInMeter;
                                _valueBMI = _weight / _heightInMeterSquare;
                                print("$_valueBMI");
                                String _twoDigitDouble =
                                    _valueBMI.toStringAsFixed(2);
                                print("$_twoDigitDouble");
                                if (_valueBMI < 18.5) {
                                  _conditionCheckForBmi = "Underweight";
                                } else if (_valueBMI >= 18.5 &&
                                    _valueBMI <= 24.9) {
                                  _conditionCheckForBmi = "Healthy";
                                } else if (_valueBMI >= 25 &&
                                    _valueBMI <= 29.9) {
                                  _conditionCheckForBmi = "Overweight";
                                } else {
                                  _conditionCheckForBmi = "Obese";
                                }
                                print("$_conditionCheckForBmi");

                                showModalBottomSheet(
                                    context: context,
                                    backgroundColor: modalButtomColor,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(20),
                                            topRight: Radius.circular(20))),
                                    builder: ((context) {
                                      return Container(
                                        height: 145,
                                        child: Center(
                                          child: Column(
                                            children: [
                                              Text(
                                                "YOUR RESULT",
                                                style: TextStyle(
                                                    fontSize: 35,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Text(
                                                "$_twoDigitDouble",
                                                style: TextStyle(
                                                    fontSize: 30,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Text(
                                                "$_conditionCheckForBmi",
                                                style: TextStyle(
                                                    fontSize: 30,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )
                                            ],
                                          ),
                                        ),
                                      );
                                    }));
                              },
                              child: Row(
                                children: [
                                  Container(
                                    width: 235,
                                    height: 60,
                                    color: titleColor,
                                    child: Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Row(
                                        children: [
                                          Text(
                                            "       CALCULATE",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: 23,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
