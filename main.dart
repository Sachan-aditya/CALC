// ignore_for_file: unnecessary_string_interpolations

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      theme: ThemeData(),
      home: const Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  late int first;
  late int second;
  String textdisplay = "";
  late String res;
  late String operator;
  // ignore: non_constant_identifier_names
  void BUTTONCLICK(String nnav) {
    if (nnav == 'C') {
      textdisplay = "";
      first = 0;
      second = 0;
      res = "";
    } else if (nnav == "+" || nnav == "-" || nnav == "/" || nnav == "*") {
      first = int.parse(textdisplay);
      res = "";
      operator = nnav;
    } else if (nnav == "=") {
      second = int.parse(textdisplay);
      if (operator == "+") {
        res = (first + second).toString();
      }
      if (operator == "-") {
        res = (first - second).toString();
      }
      if (operator == "/") {
        res = (first / second).toString();
      }
      if (operator == "*") {
        res = (first * second).toString();
      } else {
        res = int.parse(textdisplay + nnav).toString();
      }

      setState(() {
        textdisplay = res;
      });
    }
  }

  Widget custombutton(String nnav) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(25),
        child: TextButton(
          onPressed: () {},
          child: Text(
            "$nnav",
            style: const TextStyle(fontSize: 32),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(centerTitle: true, title: const Text('Calculator')),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Expanded(
                child: Container(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      "$textdisplay",
                      style: const TextStyle(
                          fontSize: 25, fontWeight: FontWeight.normal),
                    ))),
            Row(children: <Widget>[
              custombutton("9"),
              custombutton("8"),
              custombutton("7"),
              custombutton("+"),
            ]),
            Row(
              children: <Widget>[
                custombutton("6"),
                custombutton("5"),
                custombutton("4"),
                custombutton("-"),
              ],
            ),
            Row(
              children: <Widget>[
                custombutton("3"),
                custombutton("2"),
                custombutton("1"),
                custombutton("*"),
              ],
            ),
            Row(
              children: <Widget>[
                custombutton("C"),
                custombutton("0"),
                custombutton("="),
                custombutton("/"),
              ],
            ),
          ],
        ));
  }
}
