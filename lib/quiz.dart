import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int selectedQuestion;
  final void Function(int) onAnswer;

  const Quiz({
    required this.questions,
    required this.selectedQuestion,
    required this.onAnswer,
    super.key,
  });

    bool get haveSelectedQuestion {
    return selectedQuestion < questions.length;
  }


  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> answers = haveSelectedQuestion ? questions[selectedQuestion]["answers"] as List<Map<String, Object>> : [];

    return Column(
      children: <Widget>[
        Question(questions[selectedQuestion]["text"] as String),
        ...answers
        .map((ans) {
          return Answer(
            ans["text"].toString(),
            () => onAnswer(int.parse (ans["Points"].toString())),
          );
        }).toList(),
      ],
    );
  }
}