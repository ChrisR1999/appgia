import 'package:app_trabajo/utils/rescatist_utils.dart';

class PanicResponse {
  String id;
  String name;
  String number;
  int distance;
  int estimateTime;
  double latitude;
  double longitude;
  String typeOfPanic;

  PanicResponse(
      {this.id,
      this.name,
      this.number,
      this.latitude,
      this.longitude,
      this.distance,
      this.estimateTime,
      this.typeOfPanic});

  void fromJson(json) {
    this.id = json['id'];
    this.name = json['name'];
    this.number = json['number'];
    this.distance = int.parse(json['distance']);
    this.estimateTime = int.parse(json['estimateTime']);
    this.latitude = double.parse(json['latitude']);
    this.longitude = double.parse(json['longitude']);
    this.typeOfPanic = json['typeOfPanic'];
    _fillUtils();
  }

  void _fillUtils() {
    RescatistUtils.firebaseId = this.id;
    RescatistUtils.name = this.name;
    RescatistUtils.number = this.number;
    RescatistUtils.distance = this.distance;
    RescatistUtils.estimateTime = this.estimateTime;
    RescatistUtils.latitude = this.latitude;
    RescatistUtils.longitude = this.longitude;
  }
}
