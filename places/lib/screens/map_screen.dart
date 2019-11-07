import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:places/models/place.dart';

class MapScreen extends StatefulWidget {
  static final String routName = '/map_screen';

  final PlaceLocation intialLocation;
  final bool isSelecting;

  MapScreen(
      {this.intialLocation =
          const PlaceLocation(latitude: 37.422, longitude: -122.084),
      this.isSelecting = false});
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  LatLng _pickedLocation;

  void _selectLocation(LatLng position) {
    setState(() {
      _pickedLocation = position;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: _pickedLocation == null ? null: () {
              Navigator.of(context).pop(_pickedLocation);
            },
          )
        ],
        title: Text('Map'),
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
            target: LatLng(widget.intialLocation.latitude,
                widget.intialLocation.longitude)),
        onTap: widget.isSelecting ? _selectLocation : null,
        markers: _pickedLocation == null
            ? null
            : {Marker(markerId: MarkerId('m1'), position: _pickedLocation)},
      ),
    );
  }
}
