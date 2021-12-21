import 'package:flutter/material.dart';
import 'package:flutter_basic_project/result.dart';
import './quiz.dart';

void main() {
  var obj = MyFirstApp();
  runApp(obj);
  // can also be written as
  // runApp(MyFirstApp())
}

// main method can also be given as lambda call as...
// void main() => runApp(MyFirstApp());
class MyFirstApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyFirstAppState();
  }
}

class _MyFirstAppState extends State<MyFirstApp> {
  final _questions = const [
    {
      'questionText': 'What\'s your favorite colour?',
      'answers': [
        {'text': 'Red', 'score': 10},
        {'text': 'Green', 'score': 5},
        {'text': 'Blue', 'score': 2},
        {'text': 'Yellow', 'score': 1}
      ],
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        {'text': 'Lion', 'score': 10},
        {'text': 'Tiger', 'score': 5},
        {'text': 'Rabbit', 'score': 2},
        {'text': 'Cow', 'score': 1}
      ],
    },
    {
      'questionText': 'What\'s your favorite place?',
      'answers': [
        {'text': 'London', 'score': 10},
        {'text': 'San Francisco', 'score': 5},
        {'text': 'Paris', 'score': 2},
        {'text': 'Amsterdam', 'score': 1}
      ],
    },
    {
      'questionText': 'What\'s your favorite fruit?',
      'answers': [
        {'text': 'Apple', 'score': 10},
        {'text': 'Guava', 'score': 5},
        {'text': 'Pineapple', 'score': 2},
        {'text': 'Mango', 'score': 1}
      ],
    },
  ];
  var _questionIndex = 0;
  var _totalScore = 0;
  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  // The function to be executed on button press
  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex += 1;
    });
    print(_questionIndex); // prints in the debug console
    if (_questionIndex < _questions.length) {
      print('We have more questions!');
    } else {
      print('End of questions');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'My Quiz App',
          ),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questions: _questions,
                questionIndex: _questionIndex,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
