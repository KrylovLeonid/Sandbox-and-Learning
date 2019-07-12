import 'package:flutter/material.dart';
import 'QuestionWidget.dart';
import 'AnswerWidget.dart';

class QuizWidget extends StatelessWidget {
  final Function answerFunction;
  final List<Map<String,Object>> answersList;
  final String question;

  QuizWidget(this.answerFunction, this.answersList, this.question);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(question),
        ...answersList .map((answer) {
          return AnswerWidget(() => answerFunction(answer['scores']), answer['text']);
        }).toList()
      ],
    );
  }
}
