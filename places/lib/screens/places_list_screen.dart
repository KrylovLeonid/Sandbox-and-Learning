import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:places/screens/add_place_screen.dart';
import 'package:places/providers/places_provider.dart';
import 'place_detail_screen.dart';

class PlacesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Youre places'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                Navigator.of(context).pushNamed(AddPlaceScreen.routName);
              },
            )
          ],
        ),
        body: FutureBuilder(
            future: Provider.of<PlacesProvider>(context, listen: false)
                .fetchPlaces(),
            builder: (context, snapshot) => snapshot.connectionState ==
                    ConnectionState.waiting
                ? Center(child: CircularProgressIndicator())
                : Consumer<PlacesProvider>(
                    child: Center(child: const Text('NO DATA!')),
                    builder: (context, places, ch) => places.items.length <= 0
                        ? ch
                        : ListView.builder(
                            itemCount: places.items.length,
                            itemBuilder: (context, i) => ListTile(
                              leading: CircleAvatar(
                                backgroundImage:
                                    FileImage(places.items[i].image),
                              ),
                              title: Text(places.items[i].title),
                              subtitle: places.items[i].location.address == null
                                  ? null
                                  : Text(places.items[i].location.address),
                              onTap: (){
                                Navigator.of(context).pushNamed(PlaceDetailScreen.routName, arguments: places.items[i].id);
                              },
                            ),
                          ),
                  )));
  }
}
