import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:common_shop_app/providers/cart.dart' show Cart;
import 'package:common_shop_app/widgets/cart_item.dart';
import 'package:common_shop_app/providers/orders.dart';

class CartScreen extends StatelessWidget {
  static const routName = '/cart_screen';

  @override
  Widget build(BuildContext context) {
    final cartData = Provider.of<Cart>(context);

    return Scaffold(
        appBar: AppBar(
          title: Text('Cart'),
        ),
        body: Column(children: <Widget>[
          Card(
            margin: EdgeInsets.all(15),
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Total:', style: TextStyle(fontSize: 20)),
                  SizedBox(
                    width: 10,
                  ),
                  Spacer(),
                  Chip(
                    label: Text(
                      '\$${cartData.totalAmount}',
                    ),
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  FlatButton(
                    child: Text('ORDER NOW'),
                    textColor: Theme.of(context).primaryColor,
                    onPressed: () {
                      Provider.of<Orders>(context, listen: false).addOrder(cartData.items.values.toList(), cartData.totalAmount);
                      cartData.clear();

                    },
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (ctx, i) => CartItem(
                  cartData.items.values.toList()[i].id,
                  cartData.items.values.toList()[i].price,
                  cartData.items.values.toList()[i].quantity,
                  cartData.items.values.toList()[i].title,
                  cartData.items.keys.toList()[i]),
              itemCount: cartData.items.length,
            ),
          )
        ]));
  }
}
