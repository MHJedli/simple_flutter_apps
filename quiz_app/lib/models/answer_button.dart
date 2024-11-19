import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton(
      {super.key, required this.onTap, required this.answerText});
  final String answerText;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      child: Text(
        answerText,
        textAlign: TextAlign.center,
      ),
      style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
          backgroundColor: const Color.fromARGB(255, 92, 12, 106),
          foregroundColor: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(40))),
    );
  }
}
