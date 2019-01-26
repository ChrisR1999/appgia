import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geolocator/geolocator.dart';

class LocationRequest {
  static Future<GeoPoint> getPosition() async {
    GeoPoint location;
    Position position;
    position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    location = new GeoPoint(position.latitude, position.longitude);
    return location;
  }
}
