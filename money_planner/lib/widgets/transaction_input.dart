import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionInputWidget extends StatefulWidget {
  TransactionInputWidget(this.addTransaction);

  final Function addTransaction;
  DateTime selectedDate;

  @override
  _TransactionInputWidgetState createState() => _TransactionInputWidgetState();
}

class _TransactionInputWidgetState extends State<TransactionInputWidget> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  void submit() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0 || widget.selectedDate == null) return;

    widget.addTransaction(enteredTitle, enteredAmount, widget.selectedDate);
    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2019),
        lastDate: DateTime.now()).then((pickedDate){
          if(pickedDate == null)
            return;
          setState(() {
            widget.selectedDate = pickedDate;
          });

    });
  }

  //UI starts here
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
                decoration: InputDecoration(labelText: 'Title'),
                controller: titleController,
                onSubmitted: (_) => submit()),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submit(),
            ),
            Container(
              height: 70,
              child: Row(
                children: <Widget>[
                  Expanded(child: Text ( widget.selectedDate == null ? 'No date chosen': DateFormat.yMMMd().format(widget.selectedDate))),
                  Expanded(
                    child: FlatButton(
                      
                      child: Text('Pick date'),
                      textColor: Theme.of(context).primaryColor,
                      onPressed: _presentDatePicker,
                    ),
                  )
                ],
              ),
            ),
            RaisedButton(
              child: Text('Add transaction'),
              textColor: Colors.white,
              color: Theme.of(context).primaryColor,
              onPressed: () {
                submit();
              },
            )
          ],
        ),
      ),
    );
  }
}
