import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:app_trabajo/utils/display_utils.dart';
import 'package:app_trabajo/utils/user_utils.dart';
import 'package:app_trabajo/requests/location_request.dart';
import 'package:app_trabajo/models/panicrequest_model.dart';

class PanicButton extends StatefulWidget {
  final String label;
  final String typeOfAlert;
  final String imageRoute;

  PanicButton({this.label, this.typeOfAlert, this.imageRoute});

  @override
  State<StatefulWidget> createState() {
    return _PanicButton();
  }
}

class _PanicButton extends State<PanicButton> {
  bool _enabled;
  Color _colorState;
  PanicModel _request = new PanicModel();

  @override
  void initState() {
    _colorState = Color(0xFF1D1F1E);
    _enabled = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double sizeX = DisplayUtils.getSizeX() / 3.2;

    return Container(
        height: sizeX * 1.5,
        width: sizeX,
        decoration: BoxDecoration(
            color: _colorState, borderRadius: BorderRadius.circular(10.0)),
        child: RawMaterialButton(
            onPressed: () {
              LocationRequest.getPosition().then((location) {
                setState(() {
                  if (_enabled) {
                    new CircularProgressIndicator();
                    print(widget.typeOfAlert);
                    _colorState = Colors.red[800];
                    _enabled = false;
                    _request = new PanicModel(
                        id: UserUtils.firebaseId,
                        name: UserUtils.name,
                        number: UserUtils.number,
                        latitude: location.latitude,
                        longitude: location.longitude,
                        typeOfPanic: widget.typeOfAlert);
                    sendRequest(jsonEncode(_request));
                  } else {
                    return null;
                  }
                });
              }).catchError((e) {
                print("ERROR al obtener localización:" + e.toString());
              });
            },
            highlightColor: Colors.transparent,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Image.asset(
                    widget.imageRoute,
                    width: (sizeX - (sizeX * 0.10)),
                    fit: BoxFit.contain,
                  ),
                  Text(
                    widget.label,
                    style: TextStyle(
                        color: Colors.white70,
                        fontSize: 18.0,
                        letterSpacing: 1.0,
                        fontWeight: FontWeight.bold),
                  )
                ])));
  }
}

Future<void> sendRequest(data) async {
  var url = 'http://ptsv2.com/t/tofitah/post';
  http.post(url, body: data).then((response) {
    print("Response status: ${response.statusCode}");
    print("Response body: ${response.body}");
  }).catchError((e) {
    print("Error al mandar: " + e);
  });
}
