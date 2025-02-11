import 'package:flutter/material.dart';
import 'package:meals_app/screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(String text, IconData icon, Function tapHandler) {
    return ListTile(
      leading: Icon(icon, size: 26),
      title: Text(
        text,
        style: TextStyle(
            fontFamily: 'RobotoCondenced',
            fontSize: 24,
            fontWeight: FontWeight.bold),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            child: Text('Dishes filter',
                style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 30,
                    color: Theme.of(context).primaryColor)),
            alignment: Alignment.centerLeft,
            height: 100,
            width: double.infinity,
            color: Theme.of(context).accentColor,
            padding: EdgeInsets.all(20),
          ),
          SizedBox(height: 20),
          buildListTile('Meals', Icons.restaurant, () {
            Navigator.of(context).pushReplacementNamed('/');
          }),
          buildListTile('Filters', Icons.settings, () {
            Navigator.of(context).pushReplacementNamed(FilterScreen.routName);
          })
        ],
      ),
    );
  }
}
