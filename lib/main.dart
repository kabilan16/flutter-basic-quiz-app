import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';
void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}
class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'Where do you live?',
      'answers': [
        {'text': 'Chennai', 'score': 100},
        {'text': 'Madurai', 'score': 80},
        {'text': 'Trichy', 'score': 70},
        {'text': 'Mumbai', 'score': 40},
      ],
    },
    {
      'questionText': 'Which college do you study in?',
      'answers': [
        {'text': 'Anna University', 'score': 100},
        {'text': 'VIT', 'score': 70},
        {'text': 'SSN', 'score': 70},
        {'text': 'Loyola', 'score': 40},
      ],
    },
    {
      'questionText': 'Which school did you study in?',
      'answers': [
        {'text': 'CV', 'score': 100},
        {'text': 'VM', 'score': 80},
        {'text': 'Stj', 'score': 60},
        {'text': 'PSBB', 'score': 30},
      ],
    },
    {
      'questionText': 'Which department are you in?',
      'answers': [
        {'text': 'CSE', 'score': 100},
        {'text': 'IT', 'score': 90},
        {'text': 'ECE', 'score': 80},
        {'text': 'Mech', 'score': 60},
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

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('Few more question(s) left');
    } else {
      print('Questions are over');
    }
  }

  @override
  Widget build(BuildContext context) {
    // var dummy = const ['Hello'];
    // dummy.add('Max');
    // print(dummy);
    // dummy = [];
    // questions = []; // does not work if questions is a const

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
