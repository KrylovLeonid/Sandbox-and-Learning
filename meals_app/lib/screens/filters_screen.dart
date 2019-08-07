import 'package:flutter/material.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const String routName = '/filter_screen';
  final Function setFilters;
  final Map<String, bool> _filters;




  FilterScreen(this.setFilters, this._filters);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {

  Widget _buildSwitchListTile(String titleText, String subtitleText,
      bool currentValue, Function updatedValue) {
    return SwitchListTile(
        title: Text(titleText),
        value: currentValue,
        subtitle: Text(subtitleText),
        onChanged: updatedValue);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            IconButton(icon: Icon(Icons.save), onPressed: () {widget.setFilters(widget._filters);},)
          ],
        ),
        drawer: MainDrawer(),

        body: Column(
          children: <Widget>[
            Container(
                padding: EdgeInsets.all(20),
                child: Text(
                  'Adjust your meals',
                  style: Theme.of(context).textTheme.title,
                )),
            Expanded(
              child: ListView(
                children: <Widget>[
                  _buildSwitchListTile(
                      'Glutenfree',
                      'Only glutenfree meals',
                      widget._filters['gluten'],
                      (newValue) => setState(() {
                        widget._filters['gluten'] = newValue;
                          })),
                  _buildSwitchListTile(
                      'Vegan',
                      'Only vegan meals',
                      widget._filters['vegan'],
                      (newValue) => setState(() {
                        widget._filters['vegan'] = newValue;
                          })),
                  _buildSwitchListTile(
                      'Vegetarian',
                      'Only vegetarian meals',
                      widget._filters['vegeterian'],
                      (newValue) => setState(() {
                        widget._filters['vegeterian'] = newValue;
                          })),
                  _buildSwitchListTile(
                      'Lactosefree',
                      'Only lactosfree meals',
                      widget._filters['lactose'],
                      (newValue) => setState(() {
                        widget._filters['lactose'] = newValue;
                          }))
                ],
              ),
            )
          ],
        ));
  }
}
