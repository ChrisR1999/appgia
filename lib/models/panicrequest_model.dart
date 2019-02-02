class PanicRequest {
  String id;
  String name;
  String number;
  double latitude;
  double longitude;
  String typeOfPanic;

  PanicRequest(
      {this.id,
      this.name,
      this.number,
      this.latitude,
      this.longitude,
      this.typeOfPanic});

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {
      'id': this.id,
      'name': this.name,
      'number': this.number,
      'latitude': this.latitude.toString(),
      'longitude': this.longitude.toString(),
      'panic': this.typeOfPanic
    };
    return data;
  }
}
