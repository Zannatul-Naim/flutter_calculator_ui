
import 'package:flutter/material.dart';

class CalculatorHomePage extends StatefulWidget {
  const CalculatorHomePage(
      {
        this.title,
        super.key
      });
  final String? title;
  @override
  State<CalculatorHomePage> createState() => _CalculatorHomePageState();
}

class _CalculatorHomePageState extends State<CalculatorHomePage> {
  String output = "";
  String _output = "";
  double op1 = 0.0;
  double op2 = 0.0;
  String operand = "";

  buttonPressed(String buttonText) {
    if(buttonText == "CLEAR") {
      _output = "";
      op1 = op2 = 0.0;
      operand = "";
    } else if(buttonText == '/' || buttonText == 'x' || buttonText == '+' || buttonText == '-') {
      op1 = double.parse(output);
      operand = buttonText;
      _output = "";
    } else if(buttonText == '.') {
      if(_output.contains(".")) {
        return "Error! duplicate dot found!";
      } else {
        _output = _output + buttonText;
      }
    } else if(buttonText == '=') {
      if(buttonText == '+') {
        _output = (op1+op2).toString();
      } else if(buttonText == '-') {
        _output = (op1-op2).toString();
      } else if(buttonText == 'x') {
        _output = (op1*op2).toString();
      } else if(buttonText == '/') {
        _output = (op1/op2).toString();
      }
      op1 = op2 = 0.0;
      operand = '';
    } else {
      _output += buttonText;
    }
    setState(() {
      output = double.parse(_output).toStringAsFixed(2);
    });
  }

  Widget buttonStyle(String buttonText) {
    return Expanded(
      child: OutlinedButton(
        child: Text(
          buttonText,
          style: const TextStyle (
              fontSize: 20.0,
              fontWeight: FontWeight.bold
          ),
        ),
        onPressed: () => buttonPressed(buttonText),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Let's Calculate"),
      ),
      body: Column (
        children: <Widget> [
          Container (
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.symmetric(
              vertical: 24.0,
              horizontal: 12.0
            ),
            child: Text(
              output,
              style: const TextStyle(
                fontSize: 48.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Expanded (
            child: Divider(),
          ),
          Column(
            children: [
              Row(
                children: [
                  buttonStyle("7"),
                  buttonStyle("8"),
                  buttonStyle("9"),
                  buttonStyle("/"),
                ]
              ),
              Row(
                children: [
                  buttonStyle("4"),
                  buttonStyle("5"),
                  buttonStyle("6"),
                  buttonStyle("x"),
                ]
              ),
              Row(
                children: [
                  buttonStyle("1"),
                  buttonStyle("2"),
                  buttonStyle("3"),
                  buttonStyle("-"),
                ]
              ),
              Row(
                children: [
                  buttonStyle("."),
                  buttonStyle("0"),
                  buttonStyle("00"),
                  buttonStyle("+"),
                ]
              ),
              Row(
                children: [
                  buttonStyle("="),
                  buttonStyle("CLEAR"),
                ],
              ),
            ]
          ),
        ]
      ),
    );
  }
}

