import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';
import '../widgets/chart_bar.dart';

class ChartWidget extends StatelessWidget {

  double get maxSpending{
    return groupedTransactionValues.fold(0.0, (sum, item){
        return sum + item['amount'];
    });
  }

  final List<Transaction> recentTransactions;
  ChartWidget(this.recentTransactions);

  List<Map<String,Object>> get groupedTransactionValues{
    return List.generate(7, (index){
      final weekDay = DateTime.now().subtract(Duration(days: index));
      var totalSum = 0.0;
      for(var i = 0; i < recentTransactions.length; i++){
        if(recentTransactions[i].date.day == weekDay.day && recentTransactions[i].date.month == weekDay.month && recentTransactions[i].date.year == weekDay.year){
          totalSum += recentTransactions[i].amount;
        }
      }
      return {'day': DateFormat.E().format(weekDay), 'amount': totalSum};
    });
  }
//UI stars here
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        elevation: 6,
        margin: EdgeInsets.all(20),
        child: Container(
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: groupedTransactionValues.map((data){
              return Flexible(
                  fit: FlexFit.tight,
                  child: ChartBarWidget(data['day'], data['amount'], maxSpending ));
            }).toList()),
        )
      ),
    );
  }
}
