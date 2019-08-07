import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';

class MealDetailsScreen extends StatelessWidget {
  static const routName = '/meal-detail';

  final Function _toggleFavorite;
  final Function _isFavorite;
  MealDetailsScreen(this._toggleFavorite, this._isFavorite);

  @override
  Widget build(BuildContext context) {
    final String id = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == id);

    Widget buildTitle(BuildContext contest, String title) {
      return Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: Text(
          title,
          style: Theme.of(context).textTheme.title,
        ),
      );
    }

    Widget buildContainer({Widget child}) {
      return Container(
          height: 200,
          width: 300,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey)),
          child: child);
    }

    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: Icon(_isFavorite(id) as bool ? Icons.star : Icons.star_border),
          onPressed: () {
            _toggleFavorite(id);
          }),
      appBar: AppBar(
        title: Text('${selectedMeal.title}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildTitle(context, 'Ingredients'),
            buildContainer(
                child: ListView.builder(
              itemBuilder: (ctx, count) => Card(
                child: Container(
                  child: Text(selectedMeal.ingredients[count]),
                  padding: EdgeInsets.all(5),
                ),
                color: Theme.of(context).accentColor,
                margin: EdgeInsets.all(5),
              ),
              itemCount: selectedMeal.ingredients.length,
            )),
            buildTitle(context, 'Steps'),
            buildContainer(
                child: ListView.builder(
              itemBuilder: (ctx, index) => Column(
                children: <Widget>[
                  ListTile(
                    leading: CircleAvatar(
                      child: Text('# ${index + 1}'),
                    ),
                    title: Text(selectedMeal.steps[index]),
                  ),
                  Divider(
                    color: Colors.grey,
                    height: 1,
                  )
                ],
              ),
              itemCount: selectedMeal.steps.length,
            ))
          ],
        ),
      ),
    );
  }
}
