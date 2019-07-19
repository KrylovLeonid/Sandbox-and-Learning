import 'package:flutter/material.dart';
import 'package:money_planner/models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTransaction;

  TransactionList(this.transactions, this.deleteTransaction);



  @override
  Widget build(BuildContext context) {
    return Container(
        height: 400,
        child: Center(
          child: transactions.isEmpty
              ? Column(
                  children: <Widget>[
                    Text('No transaction is added',
                        style: Theme.of(context).textTheme.title),
                    SizedBox(),
                    Container(
                        height: 200,
                        child: Image.asset('assets/images/waiting.png',
                            fit: BoxFit.cover))
                  ],
                )
              : ListView.builder(
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 5,
                      margin: EdgeInsets.all(10),
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 30,
                          child: Padding(
                            padding: EdgeInsets.all(6),
                            child: FittedBox(
                              child: Text('\$${transactions[index].amount}'),
                            ),
                          ),
                        ),
                        title: Text(
                          transactions[index].title,
                          style: Theme.of(context).textTheme.title,
                        ),
                        subtitle: Text(
                          DateFormat.yMMMd().format(transactions[index].date),
                        ),
                        trailing: IconButton(
                            icon: Icon(Icons.delete),
                            color: Theme.of(context).errorColor,
                            onPressed: () => deleteTransaction(transactions[index].id)),
                      ),
                    );
                  },
                  itemCount: transactions.length,
                ),
        ));
  }
}
