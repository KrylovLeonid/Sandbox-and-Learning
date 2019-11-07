import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:places/providers/places_provider.dart';
import 'package:places/screens/map_screen.dart';

class PlaceDetailScreen extends StatelessWidget {

  static const routName = '/place_details_scree';
  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context).settings.arguments;
    final selectedPlace =
        Provider.of<PlacesProvider>(context, listen: false).findById(id);

    return Scaffold(
      appBar: AppBar(
        title: Text(selectedPlace.title),
      ),
      body: Column(
        children: <Widget>[
          Container(
              height: 250,
              width: double.infinity,
              child: Image.file(
                selectedPlace.image,
                fit: BoxFit.cover,
                width: double.infinity,
              )),
          SizedBox(
            height: 10,
          ),
          Text(selectedPlace.location.address,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, color: Colors.grey)),
          SizedBox(height: 10),
          FlatButton(
            child: Text('View on map'),
            textColor: Theme.of(context).primaryColor,
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=> MapScreen(intialLocation: selectedPlace.location)));
            },
          )
        ],
      ),
    );
  }
}
