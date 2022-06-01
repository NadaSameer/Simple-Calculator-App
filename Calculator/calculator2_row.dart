import 'package:calculator_app/Calculator3.dart';
import 'package:flutter/material.dart';

class CalculatorRow extends StatelessWidget {
  CalculatorState calculatorState;
  List<String> labels;
  List<Widget> buttons = [];

  CalculatorRow(this.calculatorState, this.labels,);

  @override
  Widget build(BuildContext context) {
    labels.forEach((label) {
      buttons.add(ElevatedButton(
          onPressed: () {
            calculatorState.buttonPressed(label);
          },
          child: Text(
            label,
            style: TextStyle(
              fontSize: 30,
              color: Colors.red[900],
            ),
          )));
    });
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: buttons,
    );
  }
}
