import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:places/screens/places_list_screen.dart';
import 'providers/places_provider.dart';
import 'package:places/screens/add_place_screen.dart';
import 'screens/map_screen.dart';
import 'screens/place_detail_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: PlacesProvider(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
          accentColor: Colors.amber,
        ),
        home: PlacesScreen(),
        routes: {
          AddPlaceScreen.routName: (ctx) => AddPlaceScreen(),
          MapScreen.routName: (ctx) => MapScreen(),
          PlaceDetailScreen.routName: (ctx) => PlaceDetailScreen()
        },
      ),
    );
  }
}