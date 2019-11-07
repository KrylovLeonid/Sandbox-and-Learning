import 'dart:io';

import 'package:flutter/material.dart';
import 'package:places/providers/places_provider.dart';
import 'package:places/widgets/image_input.dart';
import 'package:provider/provider.dart';

import 'package:places/widgets/location_input.dart';
import 'package:places/models/place.dart';



class AddPlaceScreen extends StatefulWidget {
  static const routName = '/add_place';


  @override
  _AddPlaceScreenState createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {
  TextEditingController _titleController;
  File _pickedImage;
  PlaceLocation _pickedLocation;

  void selectImage(File pickedImage){
    _pickedImage = pickedImage;
  }

  void _selectPlace(double longitude, double latitude){
    _pickedLocation = PlaceLocation(longitude: longitude, latitude: latitude);
  }

  void _savePlace(){
    if(_titleController.text.isEmpty || _pickedImage == null || _pickedLocation == null)
      return;
    Provider.of<PlacesProvider>(context, listen: false).addPlace(_titleController.text, _pickedImage, _pickedLocation);
    Navigator.of(context).pop();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add a new place.'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: <Widget>[
                    TextField(decoration: InputDecoration(labelText: 'Title'), controller: _titleController,),
                    SizedBox(height: 10),
                    ImageInputWidget(selectImage),
                    SizedBox(height: 10),
                    LocationInput(_selectPlace),
                  ],
                ),
              ),
            ),
          ),
          RaisedButton.icon(
            onPressed: _savePlace,
            icon: Icon(Icons.add),
            label: Text('AddPlace'),
            elevation: 0,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            color: Theme.of(context).accentColor,
          )
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController();
  }
}
