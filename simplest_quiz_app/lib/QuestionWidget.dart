import 'package:flutter/material.dart';
class QuestionWidget extends StatelessWidget {
  final String questionText;

  QuestionWidget(this.questionText);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        margin: EdgeInsets.all(10),
        child: Text(questionText,
          style: TextStyle(fontSize: 24),
          textAlign: TextAlign.center,
        )
      );
  }
}
