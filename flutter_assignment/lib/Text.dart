import 'package:flutter/material.dart';

class CustomTextWidget extends StatelessWidget {
  final String text;

  CustomTextWidget(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        text,
        style: TextStyle(
          fontSize: 24,
          color: Colors.indigo
        ),
      ),
      padding: EdgeInsets.all(20),
    );
  }
}
