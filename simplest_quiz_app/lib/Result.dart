import 'package:flutter/material.dart';

class ResultWidget extends StatelessWidget {
  final int totalSore;
  final Function restart;
  ResultWidget(this.totalSore, this.restart);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
          children: [
            Text('Your score is:' + totalSore.toString()),
            FlatButton(
              child: Text('RestartQuiz'),
              onPressed: restart,
            )
          ]),
    );
  }
}
