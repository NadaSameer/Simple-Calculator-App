import 'package:calculator_app/calculator_button.dart';
import 'package:flutter/material.dart';

main() {
  runApp(MaterialApp(
    home: Calculator2(),
  ));
}

class Calculator2 extends StatefulWidget {
  @override
  Calculator2State createState() => Calculator2State();
}

class Calculator2State extends State<Calculator2> {
  final input1Controller = TextEditingController();
  final input2Controller = TextEditingController();
  final resultController = TextEditingController();
  String value = 'Value';

  operation(op) {
    double p1 = double.parse(input1Controller.text);
    double p2 = double.parse(input2Controller.text);
    double result = 0.0;
    switch (op) {
      case '+':
        result = p1 + p2;
        break;
      case '-':
        result = p1 - p2;
        break;
      case '*':
        result = p1 * p2;
        break;
      case '/':
        result = (p2 == 0) ? 0 : p1 / p2;
        break;
    }

    resultController.text = result.toString();
    setState(() {
      value = result.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Calculator',
          style: TextStyle(
            fontSize: 28,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        child: Column(
          children: [
            Text(
              value,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: input1Controller,
                  ),
                ),
                Expanded(
                  child: TextField(
                    controller: input2Controller,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ButtonWidget('+', this),
                ButtonWidget('-', this),
                ButtonWidget('*', this),
                ButtonWidget('/', this),
              ],
            ),
            TextField(
              controller: resultController,
              enabled: false,
            )
          ],
        ),
      ),
    );
  }
}
