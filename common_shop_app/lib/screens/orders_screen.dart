import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:common_shop_app/providers/orders.dart';
import 'package:common_shop_app/widgets/order_item.dart' as ord;
import 'package:common_shop_app/widgets/app_drawer.dart';

class OrdersScreen extends StatelessWidget {
  static const routName = '/orders_screen';
  @override
  Widget build(BuildContext context) {
    final orders = Provider.of<Orders>(context);

    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: Text('Orders'),
      ),
      body: ListView.builder(
        itemCount: orders.orders.length,
        itemBuilder: (context, i) => ord.OrderItem(orders.orders[i]),
      ),
    );
  }
}
