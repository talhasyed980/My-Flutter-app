import 'package:flutter/material.dart';
import 'quiz.dart';
import 'result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'what\'s your favorite color?',
      'answers': [
        {'text': 'Black', 'score': 1},
        {'text': 'Green', 'score': 3},
        {'text': 'Red', 'score': 10},
        {'text': 'White', 'score': 5},
      ],
    },
    {
      'questionText': 'what\'s your favorite animal?',
      'answers': [
        {'text': 'Rabbit', 'score': 3},
        {'text': 'Snake', 'score': 10},
        {'text': 'Elephant', 'score': 5},
        {'text': 'Lion', 'score': 9},
      ],
    },
    {
      'questionText': 'who\'s your favorite teacher?',
      'answers': [
        {'text': 'Thomas', 'score': 1},
        {'text': 'Arthur', 'score': 3},
        {'text': 'John', 'score': 10},
        {'text': 'Alfie', 'score': 5},
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

  void _answerQuestions(int score) {
    // var aBool = true;
    // aBool = false;
    _totalScore += score;
    if (_questionIndex < _questions.length) {
      print('We Have More Questions!');
    } else {
      print('No More Questions!');
    }

    setState(() {
      _questionIndex += 1;
    });
    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestions: _answerQuestions,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
