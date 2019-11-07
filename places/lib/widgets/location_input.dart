import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:location/location.dart';
import 'package:places/widgets/image_input.dart';
import 'package:places/helper/location_helper.dart';
import 'package:places/screens/map_screen.dart';
import 'package:places/models/place.dart';

class LocationInput extends StatefulWidget {

  Function onSelectPlace;
  LocationInput(this.onSelectPlace);
  @override
  _LocationInputState createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  String _previewImageUrl;

  Future<void> _selectOnMap() async {
    final LatLng selectedLoacation = await Navigator.of(context)
        .push<LatLng>(MaterialPageRoute(
            builder: (ctx) => MapScreen(
                  isSelecting: true,
                )));

    if(selectedLoacation == null)
      return;

    widget.onSelectPlace(selectedLoacation.longitude, selectedLoacation.latitude);
  }

  Future<void> _getUserLocation() async {
    final locationData = await Location().getLocation();
    final tempImageUrl = LocationHelper.generateMapPreviewUrl(
        locationData.longitude, locationData.latitude);

    setState(() {
      _previewImageUrl = tempImageUrl;
    });
    widget.onSelectPlace(locationData.longitude, locationData.latitude);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
            alignment: Alignment.center,
            decoration:
                BoxDecoration(border: Border.all(width: 1, color: Colors.grey)),
            height: 170,
            width: double.infinity,
            child: _previewImageUrl == null
                ? Text('NO DATA')
                : Image.network(
                    _previewImageUrl,
                    fit: BoxFit.cover,
                  )),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton.icon(
                textColor: Theme.of(context).primaryColor,
                icon: Icon(Icons.location_on),
                label: Text('Current location'),
                onPressed: _getUserLocation),
            FlatButton.icon(
                textColor: Theme.of(context).primaryColor,
                icon: Icon(Icons.map),
                label: Text('Select on map'),
                onPressed: _selectOnMap),
          ],
        )
      ],
    );
  }
}
