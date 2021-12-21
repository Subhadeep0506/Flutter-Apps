import 'package:flutter/material.dart';

class Answers extends StatelessWidget {
  final VoidCallback answerHandler;
  final String answerText;
  Answers(this.answerHandler, this.answerText);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.tryParse("250"),
      child: RaisedButton(
        color: Colors.lightBlueAccent[400],
        textColor: Colors.white,
        onPressed: answerHandler,
        child: Text(answerText),
      ),
    );
  }
}
