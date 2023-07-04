import 'package:flutter/material.dart';
import './result.dart';
import './quiz.dart';

void main() => runApp(const QuestionApp());

class _QuestionAppState extends State<QuestionApp> {
  var _selectedQuestion = 0;
  var _totalPoints = 0;
  final _questions= const[
    {
      "text": "What's the biggest planet?",
      "answers": [
        {"text":"Earth", "Points":0},
        {"text":"Jupiter", "Points":10},
        {"text":"Neptune", "Points":0},
        {"text":"Saturn", "Points":0},
      ],
    },
    {
      "text": "What's the world's fastest land animal",
      "answers": [
        {"text":"Hyena", "Points": 0},
        {"text":"Lion", "Points": 0},
        {"text":"Horse", "Points": 0},
        {"text":"Cheetah", "Points": 10},
      ],
    },
    {
      "text": "Who discovered gravity",
      "answers": [
        {"text":"Isaac Newton", "Points":"10"},
        {"text":"Watson and Crick", "Points":"0"},
        {"text":"Pedro Álvares Cabral", "Points":"0"},
        {"text":"Carl Benz", "Points":"0"},
      ],
    },
  ];

  void _answer(int Points) {
    if(haveSelectedQuestion) {
      setState(() {
        _selectedQuestion++;
        _totalPoints += Points;  
      });
    }
  }

  void _resetQuiz() {
    setState(() {
      _selectedQuestion = 0;
      _totalPoints = 0;
    });
  }

  bool get haveSelectedQuestion {
    return _selectedQuestion < _questions.length;
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Questions"),
        ),
        body: haveSelectedQuestion
        ? Quiz(
          questions: _questions,
          selectedQuestion: _selectedQuestion,
          onAnswer: _answer,) 
        : Result(_totalPoints, _resetQuiz),
      ),
    );
  }
}
class QuestionApp extends StatefulWidget{
  const QuestionApp({super.key});
  @override
  _QuestionAppState createState() {
    return _QuestionAppState();
  }
}