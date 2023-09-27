import 'package:flutter/material.dart';
import 'package:flutter_calculator/CalculatorHomePage.dart';
void main() => runApp(
  const MyApp()
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp (
      title: 'Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CalculatorHomePage(title: 'Calculator'),
    );
  }
}
