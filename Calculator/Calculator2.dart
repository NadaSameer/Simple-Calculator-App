import 'package:calculator_app/calculator3_row.dart';
import 'package:flutter/material.dart';

main() {
  runApp(MaterialApp(
    home: Calculator(),
  ));
}

class Calculator extends StatefulWidget {
  @override
  CalculatorState createState() => CalculatorState();
}

class CalculatorState extends State<Calculator> {
  String result = '';
  String op = 'C';
  bool opPressed = false;
  double value = 0;

  buttonPressed(label) {
    if (int.tryParse(label) != null) {
      digitPressed(label);
    } else {
      operationPressed(label);
    }
  }

  digitPressed(label) {
    if (opPressed) {
      value = double.parse(result);
      result = '';
      opPressed = false;
    }
    setState(() {
      result = result + label; //235
    });
  }

  operationPressed(label) {
    if (op != 'C') {
      switch (op) {
        case '+':
          value = value + double.parse(result);
          break;
        case '-':
          value = value - double.parse(result);
          break;
        case '*':
          value = value * double.parse(result);
          break;
        case '/':
          value =
              (double.parse(result) == 0) ? 0 : value / double.parse(result);
          break;
      }
      setState(() {
        result = value.toString();
      });
    }

    op = (label == '=') ? 'C' : label;
    opPressed = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Calculator',
          style: TextStyle(
            fontSize: 36,
            color: Colors.red[900],
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 40,
        ),
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Text(
              result,
              style: TextStyle(
                fontSize: 36,
                color: Colors.red[900],
              ),
            ),
            CalculatorRow(this, ['7', '8', '9', '/']),
            CalculatorRow(this, ['4', '5', '6', '*']),
            CalculatorRow(this, ['1', '2', '3', '-']),
            CalculatorRow(this, ['.', '0', '=', '+']),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      opPressed = false;
                      value = 0;
                      setState(() {
                        result = '';
                      });
                    },
                    child: Text(
                      'Clear',
                      style: TextStyle(
                        fontSize: 36,
                        color: Colors.red[900],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
