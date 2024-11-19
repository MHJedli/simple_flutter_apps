import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/models/answer_button.dart';
import 'package:quiz_app/data/questions.dart';

class QuestionsScreen extends StatefulWidget {
  QuestionsScreen({super.key, required this.onSelectAnswer});
  final void Function(String answer) onSelectAnswer;

  State<QuestionsScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;
  void answerQuestion(String selectedAnswer) {
    widget.onSelectAnswer('...');
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 213, 142, 237),
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            ...currentQuestion.getShuffledAnswers().map((answer) {
              return AnswerButton(
                  onTap: () {
                    answerQuestion(answer);
                  },
                  answerText: answer);
            }),
          ],
        ),
      ),
    );
  }
}

// My Solution in Design :
//class _QuestionScreenState extends State<QuestionsScreen> {
//  @override
//  Widget build(context) {
//    return Center(
//      child: Column(
//        mainAxisSize: MainAxisSize.min,
//        children: [
//          Container(
//            width: 300,
//            height: 80,
//            alignment: Alignment.center,
//            child: Text(
//              'What Are the main building blocks of Flutter UIs?',
//              style: TextStyle(
//                fontSize: 20,
//              ),
//              textAlign: TextAlign.center,
//            ),
//          ),
//          SizedBox(
//            height: 10,
//          ),
//          OutlinedButton.icon(
//            onPressed: () {},
//            style: OutlinedButton.styleFrom(
//              backgroundColor: Color.fromARGB(255, 46, 9, 91),
//            ),
//            label: Container(
//              alignment: Alignment.center,
//              width: 280,
//              child: Text(
//                'Functions',
//                style: TextStyle(
//                  fontSize: 18,
//                  color: Colors.white,
//                ),
//              ),
//            ),
//          ),
//          OutlinedButton.icon(
//            onPressed: () {},
//            style: OutlinedButton.styleFrom(
//              backgroundColor: Color.fromARGB(255, 46, 9, 91),
//            ),
//            label: Container(
//              alignment: Alignment.center,
//              width: 280,
//              child: Text(
//                'Components',
//                style: TextStyle(
//                  fontSize: 18,
//                  color: Colors.white,
//                ),
//              ),
//            ),
//          ),
//          OutlinedButton.icon(
//            onPressed: () {},
//            style: OutlinedButton.styleFrom(
//              backgroundColor: Color.fromARGB(255, 46, 9, 91),
//            ),
//            label: Container(
//              alignment: Alignment.center,
//              width: 280,
//              child: Text(
//                'Blocks',
//                style: TextStyle(
//                  fontSize: 18,
//                  color: Colors.white,
//                ),
//              ),
//            ),
//          ),
//          OutlinedButton.icon(
//            onPressed: () {},
//            style: OutlinedButton.styleFrom(
//              backgroundColor: Color.fromARGB(255, 46, 9, 91),
//            ),
//            label: Container(
//              alignment: Alignment.center,
//              width: 280,
//              child: Text(
//                'Widgets',
//                style: TextStyle(
//                  fontSize: 18,
//                  color: Colors.white,
//                ),
//              ),
//            ),
//          ),
//        ],
//      ),
//    );
//  }
//}