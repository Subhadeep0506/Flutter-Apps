import 'package:flutter/material.dart';

import './answers.dart';
import './questions.dart';
import './main.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionIndex;
  final Function answerQuestion; // will not be VoidCallback

  Quiz({required this.questions, required this.answerQuestion, required this.questionIndex});
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Questions(
        questions[questionIndex]['questionText'] as String,
      ),
      ...(questions[questionIndex]['answers'] as List<Map<String, Object>>).map((answer) {
        return Answers(() => answerQuestion(answer['score']), answer['text'] as String);
      }).toList(),
    ]);
  }
}
