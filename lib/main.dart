import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:quiz_app/quiz.dart';
import 'package:quiz_app/result.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;

  var _totalScore = 0;
  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex = _questionIndex + 1;
      log('$_questionIndex');
    });
  }

  void restartQuiz() {
    setState(() {
      _totalScore = 0;
      _questionIndex = 0;
    });
  }

  var questions = [
    {
      'question': 'What\'s your favourite food?',
      'answer': [
        {'text': 'Red', 'score': 5},
        {'text': 'Black', 'score': 10},
        {'text': 'White', 'score': 1},
        {'text': 'Sky', 'score': 3}
      ]
    },
    {
      'question': 'What\'s your favourite animal?',
      'answer': [
        {'text': 'Tiger', 'score': 5},
        {'text': 'Dog', 'score': 7},
        {'text': 'Horse', 'score': 10},
        {'text': 'Leoopard', 'score': 6}
      ]
    },
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(title: const Text('My First App')),
          body: _questionIndex < questions.length
              ? Quiz(
                  questions: questions,
                  answerQuestion: _answerQuestion,
                  questionIndex: _questionIndex)
              : Result(
                  resultScore: _totalScore,
                  restartHandler: restartQuiz,
                )),
    );
  }
}
