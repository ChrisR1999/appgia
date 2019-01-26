class PanicModel {
  String id;
  String name;
  String number;
  double latitude;
  double longitude;
  String typeOfPanic;

  PanicModel(
      {this.id,
      this.name,
      this.number,
      this.latitude,
      this.longitude,
      this.typeOfPanic});
  

  Map<String, dynamic> toJson() =>
    {
      'id': id,
      'name': name,
      'number': number,
      'latitude': latitude,
      'longitude': longitude,
      'panic': typeOfPanic
    };
}
