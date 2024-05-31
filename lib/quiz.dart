import 'package:flutter/material.dart';
import 'package:quiz_app/answer.dart';
import 'package:quiz_app/question.dart';

class Quiz extends StatelessWidget {
  const Quiz(
      {super.key,
      required this.questions,
      required this.answerQuestion,
      required this.questionIndex});
  final List<Map<String, Object>> questions;
  final Function answerQuestion;
  final int questionIndex;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(questionText: questions[questionIndex]['question'] as String),
        ...(questions[questionIndex]['answer'] as List<Map<String, Object>>)
            .map(
          (answer) => Answer(
              selectedAnswer: () => answerQuestion(answer['score']),
              answerText: answer['text'] as String),
        )
      ],
    );
  }
}
