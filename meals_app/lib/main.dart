import 'package:flutter/material.dart';
import 'package:meals_app/screens/categoties_screen.dart';
import 'package:meals_app/screens/category_meals_screen.dart';
import 'screens/meal_detail_screen.dart';
import 'screens/tabs_screen.dart';
import 'screens/filters_screen.dart';
import 'model/meal.dart';
import 'dummy_data.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}



class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'vegan': false,
    'vegeterian': false,
    'lactose': false
  };

  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeals =[];


  void _setFilters( Map<String, bool> filtersState){
    setState(() {
      _filters = filtersState;
      _availableMeals = DUMMY_MEALS.where((meal){
          if(_filters['gluten'] && !meal.isGlutenFree)
            return false;
          if(_filters['vegan'] && !meal.isVegan)
            return false;
          if(_filters['vegeterian'] && !meal.isVegetarian)
            return false;
          if(_filters['lactose'] && !meal.isLactoseFree)
            return false;
          return true;
      }).toList();
    });
  }
  //favorite meals managing
  void _toggleFavorite(String mealId){
    final index = _favoriteMeals.indexWhere((meal)=>meal.id == mealId);
    if(index >= 0){
      setState(() {
        _favoriteMeals.removeAt(index);
      });

    }else{
     setState(() {
       _favoriteMeals.add(DUMMY_MEALS.firstWhere((meal)=>meal.id == mealId));
     });
    }
  }

  bool _isFavorite(String id){
    return _favoriteMeals.any((meal)=> meal.id == id);
  }
  //end
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.pink,
          accentColor: Colors.amber,
          canvasColor: Color.fromRGBO(255, 254, 229, 1),
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
              body1: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              title: TextStyle(fontFamily: 'RobotoCondensed', fontSize: 20))),
      home: TabsScreen(_favoriteMeals),
      routes: {
        CategoryMealsScreen.routName: (ctx) => CategoryMealsScreen(_availableMeals),
        MealDetailsScreen.routName: (ctx) => MealDetailsScreen(_toggleFavorite,_isFavorite ),
        FilterScreen.routName: (ctx) => FilterScreen(_setFilters, _filters)
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => CategoryMealsScreen(_availableMeals));
      },
    );
  }
}
