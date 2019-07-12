import 'package:flutter/material.dart';
import 'Quiz.dart';
import 'Result.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  State<StatefulWidget> createState(){
    return MyHomePageState();
  }


}

class MyHomePageState extends State<MyHomePage> {
 static const questionsList = [{
   'questionTest': 'What is youre favorite color?',
   'answers':[{'text':'Black', 'scores':4}, {'text':'Red', 'scores':7}, {'text':'Green', 'scores':2}, {'text':'Silver', 'scores':999}]
},
  {
  'questionTest': 'What is youre favorire animal?',
  'answers':[{'text':'Cat', 'scores':999}, {'text':'Dog', 'scores':1}, {'text':'Lion', 'scores':9}, {'text':'Pigeon', 'scores':5}]
  },
  {
  'questionTest': 'Who is youre favorire teacher?',
  'answers':[{'text':'No one', 'scores':4}, {'text':'No one', 'scores':1},{'text':'No one', 'scores':3}, {'text':'No one', 'scores':9},]
  }
  ] ;
  int _questionIndex = 0;
  int _totalScore = 0;
  void _onQuestionAnswerd(int score){
      setState(() {
        _questionIndex++;
      });
      _totalScore+=score;
  }

  void _restart(){
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _questionIndex < questionsList.length ? QuizWidget(_onQuestionAnswerd, questionsList[_questionIndex]['answers'],questionsList[_questionIndex]['questionTest']) : Center(
        child: ResultWidget(_totalScore, _restart),
      )


    );
  }
}
