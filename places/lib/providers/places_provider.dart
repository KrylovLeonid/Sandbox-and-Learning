import 'package:flutter/foundation.dart';
import 'dart:io';
import 'package:places/helper/location_helper.dart';

import 'package:places/models/place.dart';
import 'package:places/db/db.dart';

class PlacesProvider with ChangeNotifier {
  List<Place> _items = [];

  List<Place> get items {
    return [..._items];
  }

  Future<void> addPlace(
    String title,
    File image,
    PlaceLocation location,
  ) async {
    final String address = await LocationHelper.getLocationAddress(
        longitude: location.longitude, latitude: location.latitude);
    //debug output
    print("sddPlace debug: $address");
    final resultLocation = PlaceLocation(
        longitude: location.longitude,
        latitude: location.latitude,
        address: address);
    final newPlace = Place(
        id: DateTime.now().toIso8601String(),
        image: image,
        title: title,
        location: resultLocation);
    _items.add(newPlace);
    DB.insert('places', {
      'id': newPlace.id,
      'title': newPlace.title,
      'image': newPlace.image.path,
      'loc_lat': newPlace.location.latitude,
      'loc_lng': newPlace.location.longitude,
      'address': newPlace.location.address
    });
    notifyListeners();
  }

  Future<void> fetchPlaces() async {
    final data = await DB.getTableData('places');
    _items = data
        .map((item) => Place(
            id: item['id'],
            title: item['title'],
            image: File(item['image']),
            location: PlaceLocation(
                latitude: item['loc_lat'],
                longitude: item['loc_lng'],
                address: item['address'])))
        .toList();
    notifyListeners();
  }

  Place findById(String id){
    return _items.firstWhere((place) => place.id == id);
  }
}
