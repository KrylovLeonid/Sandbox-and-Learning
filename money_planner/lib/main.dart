import 'package:flutter/material.dart';
import 'widgets/transaction_input.dart';
import 'models/transaction.dart';
import 'widgets/transaction_list.dart';
import 'widgets/chart.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Money planner',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.amber,
        fontFamily: 'Quicksand',
        textTheme: ThemeData.light().textTheme.copyWith(
            title: TextStyle(
              fontFamily: 'OpenSans',
              fontSize: 18,
              fontWeight: FontWeight.bold,
            )
        ),
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
            title: TextStyle(
              fontFamily: 'OpenSans',
              fontSize: 20,
              fontWeight: FontWeight.bold,
            )
          )
        )
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _transactions = [
    Transaction(id: 't1', title: 'New shoes', amount: 12, date: DateTime.now()),
    Transaction(id: 't2', title: 'New hat', amount: 6, date: DateTime.now()),
    Transaction(id: 't3', title: 'New life', amount: 900, date: DateTime.now())
  ];

  void deleteTransaction(String id){
    setState(() {
      _transactions.removeWhere((tx){
        return tx.id == id;
      });
    });
  }

  List<Transaction> get _recentTransactions{
    return _transactions.where((tx){
      return tx.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  void _addNewTransaction(String title, double amount, DateTime date){
    final newTransaction = Transaction(title: title, amount: amount, date: date, id: DateTime.now().toString());
    setState(() {
      _transactions.add(newTransaction);
    });
  }

  void startAddingNewTransaction(BuildContext context){
    showModalBottomSheet(context: context, builder:(_){
      return GestureDetector(
          onTap: (){},
          child: TransactionInputWidget(_addNewTransaction));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () => startAddingNewTransaction(context),
            )
          ],
          title: Text('Money planner'),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
            ChartWidget(_recentTransactions),
              TransactionList(_transactions, deleteTransaction),

          ]),

        ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => startAddingNewTransaction(context),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
