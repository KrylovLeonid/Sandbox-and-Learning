import 'package:flutter/material.dart';
import 'Text.dart';
import 'TextControl.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  int textIndex = 0;

  static const List<String> _texts = [
    'some',
    'interesting',
    'story',
    'will',
    'appear',
    'if',
    'you',
    'continue',
    'to',
    'press',
  ];

  void _changeText(){
    setState(() {
      textIndex = (textIndex+1).remainder(_texts.length);
    });

  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Assigment'),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              CustomTextWidget(_texts[textIndex]),
              TextControlWidget(_changeText)
            ],
          ),
        ),
      ),
    );
  }
}
