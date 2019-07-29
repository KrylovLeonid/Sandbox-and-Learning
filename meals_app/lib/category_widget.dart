import 'package:flutter/material.dart';
import 'category_meals_screen.dart';

class CategoryWidget extends StatelessWidget {
  final String title;
  final Color color;
  CategoryWidget(this.color, this.title);

  void selectCategory(BuildContext ctx){
      Navigator.of(ctx).push(MaterialPageRoute(builder: (_){
        return CategoryMealsScreen();
      }));
  }
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){selectCategory(context);},
      splashColor: Theme.of(context).primaryColor,
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(title, style: Theme.of(context).textTheme.title,),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [color.withOpacity(0.4), color],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight),
            borderRadius: BorderRadius.circular(15)),
      ),
    );
  }
}
