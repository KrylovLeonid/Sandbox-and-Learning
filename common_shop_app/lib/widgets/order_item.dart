import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:common_shop_app/providers/orders.dart' as ord;

class OrderItem extends StatelessWidget {
  final ord.OrderItem order;

  OrderItem(this.order);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(
          children: <Widget>[
            Text(DateFormat.yMMMMEEEEd().format(order.date), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
            Container(
                height: order.products.length * 40.0,
                child: ListView(
                    children: order.products
                        .map((product) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text('${product.price} x \$${product.quantity}'),
                                  Text(product.title)
                                ],
                              ),
                        ))
                        .toList())),
          ],
        ));
  }
}
