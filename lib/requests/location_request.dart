import 'package:geolocator/geolocator.dart';

class LocationRequest {
  static Future<Position> getPosition() async {
    print("Intentando obtener ubicacion");
    Position position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    return position;
  }
}
