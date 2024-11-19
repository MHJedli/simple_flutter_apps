import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  StartScreen(void Function() this.startQuiz, {super.key});
  final void Function() startQuiz;
  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 300,
            color: Color.fromARGB(150, 255, 255, 255),
          ),
          SizedBox(
            height: 50,
          ),
          Text('Learn Flutter the fun way!',
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 213, 142, 237),
                fontSize: 25,
              )),
          SizedBox(
            height: 20,
          ),
          OutlinedButton.icon(
            onPressed: startQuiz,
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
            ),
            icon: Icon(Icons.arrow_right_alt),
            label: Text(
              'Start Quiz',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          )
        ],
      ),
    );
  }
}
