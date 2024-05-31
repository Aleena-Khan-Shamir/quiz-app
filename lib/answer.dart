import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  const Answer(
      {super.key, required this.selectedAnswer, required this.answerText});
  final Function selectedAnswer;
  final String answerText;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
          onPressed: () => selectedAnswer(), child: Text(answerText)),
    );
  }
}
