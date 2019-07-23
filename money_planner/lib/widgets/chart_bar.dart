import 'package:flutter/material.dart';

class ChartBarWidget extends StatelessWidget {
  final String weekDay;
  final double spendingAmount;
  final double spendingTotal;

  ChartBarWidget(this.weekDay, this.spendingAmount, this.spendingTotal);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          children: <Widget>[
            FittedBox(
                child: Container(
                    height: constraints.maxHeight * 0.15,
                    child: Text('\$${spendingAmount.toStringAsFixed(0)}'))),
            SizedBox(
              height: constraints.maxHeight * 0.05,
            ),
            Container(
              height: constraints.maxHeight * 0.6 ,
              width: 10,
              child: Stack(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 1.0, color: Colors.grey),
                      color: Color.fromRGBO(220, 220, 220, 1),
                    ),
                  ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    child: FractionallySizedBox(
                      heightFactor: spendingAmount / spendingTotal,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Theme.of(context).primaryColor),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: constraints.maxHeight * 0.05),
            Container(
              height: constraints.maxHeight * 0.15,
                child: FittedBox(child: Text(weekDay)))
          ],
        );
      },
    );
  }
}
