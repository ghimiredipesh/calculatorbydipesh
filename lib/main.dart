import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Calculator By Dipesh",
      home: Calculator(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String output = "0";

  var _output = "";
  double num1 = 0;
  double num2 = 0;
  String operand = "";

  buttonpressed(String buttontext) {
    if (buttontext == "Clear") {
      _output = "0";
      num1 = 0;
      num2 = 0;
      operand = "";
    } else if (buttontext == "/" ||
        buttontext == "x" ||
        buttontext == "-" ||
        buttontext == "+") {
      num1 = double.parse(output);
      operand = buttontext;
      _output = "0";
      // setState(() {
      //   _output = operand;
      // });
    } else if (buttontext == "=") {
      num2 = double.parse(output);

      if (operand == "+") {
        _output = (num1 + num2).toString();
      }
      if (operand == "-") {
        _output = (num1 - num2).toString();
      }
      if (operand == "/") {
        _output = (num1 / num2).toString();
      }
      if (operand == "x") {
        _output = (num1 * num2).toString();
      }
      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    } else {
      _output = _output + buttontext;
    }
    setState(() {
      output = double.parse(_output).toStringAsFixed(0);
    });
  }

  Widget buildbutton(String buttontext) {
    return Expanded(
      child: OutlineButton(
        padding: EdgeInsets.all(24),
        onPressed: () {
          buttonpressed(buttontext);
        },
        child: Text(
          buttontext,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculator"),
        actions: <Widget>[
          Center(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("© Dipesh Ghimire"),
          ))
        ],
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  output,
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Expanded(child: Divider()),
            Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    buildbutton("7"),
                    buildbutton("8"),
                    buildbutton("9"),
                    buildbutton("/"),
                  ],
                ),
                Row(
                  children: <Widget>[
                    buildbutton("4"),
                    buildbutton("5"),
                    buildbutton("6"),
                    buildbutton("x"),
                  ],
                ),
                Row(
                  children: <Widget>[
                    buildbutton("1"),
                    buildbutton("2"),
                    buildbutton("3"),
                    buildbutton("-"),
                  ],
                ),
                Row(
                  children: <Widget>[
                    buildbutton("0"),
                    buildbutton("Clear"),
                    buildbutton("+"),
                    buildbutton("="),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
