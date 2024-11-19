import 'package:flutter/material.dart';
class StyledText extends StatelessWidget{
  StyledText(this.outputText, {super.key});

  final String outputText;

  @override
  Widget build(context){
    return Text(
      outputText,
      style: TextStyle(color: Colors.white, fontSize: 28),
    );
  }
}
