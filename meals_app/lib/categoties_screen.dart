import 'package:flutter/material.dart';
import 'dummy_data.dart';
import 'category_widget.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("TopMeals"),),
      body: GridView(
          padding: EdgeInsets.all(25),
          children: DUMMY_CATEGORIES.map((catData) => CategoryWidget(catData.color, catData.title)).toList(),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20

          )
      )
    );

  }
}
