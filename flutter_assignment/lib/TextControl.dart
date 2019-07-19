import 'package:flutter/material.dart';

class TextControlWidget extends StatelessWidget {
  final Function onPressedFunction;

  TextControlWidget(this.onPressedFunction);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text('Press it!'),
      onPressed: onPressedFunction,
    );
  }
}
