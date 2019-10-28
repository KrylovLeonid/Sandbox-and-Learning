import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:common_shop_app/providers/auth.dart';

import 'package:common_shop_app/screens/all_screens_import.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            title: Text('This is SPARTA'),
            automaticallyImplyLeading: false,
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.shop),
            title: Text('Shop'),
            onTap:(){
              Navigator.of(context).pushReplacementNamed('/');
            }
          ),
          Divider(),
          ListTile(
              leading: Icon(Icons.payment),
              title: Text('Orders'),
              onTap:(){
                Navigator.of(context).pushReplacementNamed(OrdersScreen.routName);
              }
          ),
          Divider(),
          ListTile(
              leading: Icon(Icons.add),
              title: Text('Manage Products'),
              onTap:(){
                Navigator.of(context).pushReplacementNamed(UserProductsScreen.routName);
              }
          ),
          Divider(),
          ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Logout'),
              onTap:(){
                Navigator.of(context).pop();

                Provider.of<Auth>(context, listen: false).logout();
              }
          ),
        ],
      ),
    );
  }
}
