import 'package:flutter/material.dart';
import 'package:quiz_app/quiz.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(context) {
    return Quiz();
  }
}
