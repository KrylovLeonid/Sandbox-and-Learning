import 'package:http/http.dart' as http;
import 'dart:convert';

const String GOOGLE_API_KEY = 'AIzaSyAeOVAZEt7uZfw2y0nCCsnwIDkxVBwDq1c';

class LocationHelper{
  static String generateMapPreviewUrl(double longitude, double latitude){
    return "https://maps.googleapis.com/maps/api/staticmap?center=$latitude,$longitude&zoom=12&size=600x400&key=$GOOGLE_API_KEY";
  }

  static Future<String> getLocationAddress({double latitude, double longitude}) async{
    final url = 'https://maps.googleapis.com/maps/api/geocode/json?latlng=$latitude, $longitude&key=$GOOGLE_API_KEY';
    final response = await http.get(url);
    //debug output
    String temp = json.decode(response.body)['results'][0]['formatted_address'];
    print("getLocationAddress debug: $temp");
    return temp;

  }
}

//https://maps.googleapis.com/maps/api/geocode/json?latlng=37.4219983,-122.084&key=AIzaSyAeOVAZEt7uZfw2y0nCCsnwIDkxVBwDq1c