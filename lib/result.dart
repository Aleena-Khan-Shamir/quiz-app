import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  const Result(
      {super.key, required this.resultScore, required this.restartHandler});
  final int resultScore;
  final Function restartHandler;
  String get resultPhrase {
    String resultText;
    if (resultScore <= 8) {
      resultText = 'You are awsome and innocent!';
    } else if (resultScore <= 12) {
      resultText = 'Pretty likeable!';
    } else if (resultScore <= 16) {
      resultText = 'You are ... strange?!';
    } else {
      resultText = 'You are so bad';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(resultPhrase,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontWeight: FontWeight.bold)),
        ),
        OutlinedButton(
            onPressed: () => restartHandler(),
            child: const Text('Restart Quiz'))
      ],
    );
  }
}
