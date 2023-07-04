import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int Points;
  final void Function() onResetQuiz;
    
  const Result(this.Points, this.onResetQuiz, {super.key});

  String get resultTitle {
    if(Points < 10) {
      return "Study More!";
    } else if(Points < 20 ){
      return "Can Improve!";
    } else {
      return "Congratulations!";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Center(
          child: Text(
            resultTitle,
            style: const TextStyle(fontSize: 28),
          ),
        ),
        TextButton(
          onPressed: onResetQuiz,
          child: const Text(
            "Reset?",
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ),
      ],
    );
  }
}