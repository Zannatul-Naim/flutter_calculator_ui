import 'package:flutter/material.dart';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String _displayText = '';

  void _onButtonPressed(String buttonText) {
    setState(() {
      if (buttonText == '=') {
        // Perform calculation logic here
      } else if (buttonText == 'C') {
        _displayText = '';
      } else {
        _displayText += buttonText;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.bottomRight,
              padding: EdgeInsets.all(16.0),
              child: Text(
                _displayText,
                style: TextStyle(fontSize: 36.0),
              ),
            ),
          ),
          Row(
            children: [
              CalculatorButton(text: '7', onPressed: _onButtonPressed),
              CalculatorButton(text: '8', onPressed: _onButtonPressed),
              CalculatorButton(text: '9', onPressed: _onButtonPressed),
              CalculatorButton(text: 'x', onPressed: _onButtonPressed),
            ],
          ),
          Row(
            children: [
              CalculatorButton(text: '4', onPressed: _onButtonPressed),
              CalculatorButton(text: '5', onPressed: _onButtonPressed),
              CalculatorButton(text: '6', onPressed: _onButtonPressed),
              CalculatorButton(text: '-', onPressed: _onButtonPressed),
            ],
          ),
          Row(
            children: [
              CalculatorButton(text: '1', onPressed: _onButtonPressed),
              CalculatorButton(text: '2', onPressed: _onButtonPressed),
              CalculatorButton(text: '3', onPressed: _onButtonPressed),
              CalculatorButton(text: '+', onPressed: _onButtonPressed),
            ],
          ),
          Row(
            children: [
              CalculatorButton(text: 'C', onPressed: _onButtonPressed),
              CalculatorButton(text: '0', onPressed: _onButtonPressed),
              CalculatorButton(text: '=', onPressed: _onButtonPressed),
              CalculatorButton(text: '/', onPressed: _onButtonPressed),
            ],
          ),
        ],
      ),
    );
  }
}

class CalculatorButton extends StatelessWidget {
  final String text;
  final Function(String) onPressed;

  CalculatorButton({required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () {},
        child: Text(
          text,
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}
