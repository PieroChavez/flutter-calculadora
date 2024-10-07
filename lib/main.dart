import 'package:flutter/material.dart';
// profe, por que no lo hacemos con reat :( pipipipi
void main() => runApp(CalculatorApp());

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Basic Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  double num1 = 0;
  double num2 = 0;
  String result = '0';
  String operator = '';

  
  void onButtonPressed(String value) {
    setState(() {
      if (value == 'C') {
        result = '0';
        num1 = 0;
        num2 = 0;
        operator = '';
      } else if (value == '+' || value == '-' || value == '*' || value == '/') {
        num1 = double.parse(result);
        operator = value;
        result = '0';
      } else if (value == '=') {
        num2 = double.parse(result);
        if (operator == '+') {
          result = (num1 + num2).toString();
        } else if (operator == '-') {
          result = (num1 - num2).toString();
        } else if (operator == '*') {
          result = (num1 * num2).toString();
        } else if (operator == '/') {
          result = (num1 / num2).toString();
        }
        operator = '';
      } else {
        if (result == '0') {
          result = value;
        } else {
          result += value;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Calculator'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(16),
              alignment: Alignment.centerRight,
              child: Text(
                result,
                style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Row(
            children: [
              calculatorButton('7'),
              calculatorButton('8'),
              calculatorButton('9'),
              calculatorButton('/'),
            ],
          ),
          Row(
            children: [
              calculatorButton('4'),
              calculatorButton('5'),
              calculatorButton('6'),
              calculatorButton('*'),
            ],
          ),
          Row(
            children: [
              calculatorButton('1'),
              calculatorButton('2'),
              calculatorButton('3'),
              calculatorButton('-'),
            ],
          ),
          Row(
            children: [
              calculatorButton('C'),
              calculatorButton('0'),
              calculatorButton('='),
              calculatorButton('+'),
            ],
          ),
        ],
      ),
    );
  }

  
  Widget calculatorButton(String value) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: () => onButtonPressed(value),
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.all(24), backgroundColor: Colors.blue,
          ),
          child: Text(
            value,
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
