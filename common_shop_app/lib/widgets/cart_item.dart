import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:common_shop_app/providers/cart.dart';

class CartItem extends StatelessWidget {
  final String id;
  final double price;
  final int quantity;
  final String title;
  final String productId;

  CartItem(this.id, this.price, this.quantity, this.title, this.productId);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      confirmDismiss: (direction) {
        return showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text('Are ypu sure?'),
                  content: Text('Do you want to remove from the cart?'),
                  actions: <Widget>[
                    FlatButton(
                      child: Text('No'),
                      onPressed: () { Navigator.of(context).pop(false);},
                    ),
                    FlatButton(
                      child: Text('Yes'),
                      onPressed: () {Navigator.of(context).pop(true); },
                    ),
                  ],
                ));
      },
      direction: DismissDirection.endToStart,
      key: ValueKey(id),
      background: Container(
        color: Colors.white,
        child: Icon(
          Icons.delete,
          size: 35,
          color: Theme.of(context).errorColor,
        ),
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 20),
        margin: EdgeInsets.symmetric(vertical: 4, horizontal: 10),
      ),
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: ListTile(
            leading: CircleAvatar(child: FittedBox(child: Text('\$$price'))),
            title: Text('Total: \$${price * quantity}'),
            trailing: Text('$quantity x'),
          ),
        ),
      ),
      onDismissed: (direction) {
        Provider.of<Cart>(context, listen: false).removeItem(productId);
      },
    );
  }
}
