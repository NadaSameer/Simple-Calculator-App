import 'package:calculator_app/calculator2.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {

  String op;
  Calculator2State calc;

  ButtonWidget(this.op, this.calc);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        calc.operation(op);
      },
      child: Text(
        op,
        style: TextStyle(
          fontSize: 20,
        ),
      ),
    );
  }
}
