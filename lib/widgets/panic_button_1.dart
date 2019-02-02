import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:app_trabajo/utils/display_utils.dart';
import 'package:app_trabajo/utils/user_utils.dart';
import 'package:app_trabajo/requests/location_request.dart';
import 'package:app_trabajo/models/panicrequest_model.dart';
import 'package:app_trabajo/notifications/push_notification.dart';

class PanicButton extends StatefulWidget {
  final bool enabled;
  final String label;
  final String typeOfAlert;
  final String imageRoute;
  final Function blockButtons;
  final Function enableButtons;

  PanicButton(
      {this.enabled,
      this.label,
      this.typeOfAlert,
      this.imageRoute,
      this.blockButtons,
      this.enableButtons});

  @override
  State<StatefulWidget> createState() {
    return _PanicButton();
  }
}

class _PanicButton extends State<PanicButton> {
  double sizeX;
  bool _enabled;
  int _buttonState;
  Color _colorState;
  PanicRequest _request;

  @override
  void initState() {
    super.initState();
    _buttonState = 0;
    _colorState = Color(0xFF1D1F1E);
  }

  @override
  Widget build(BuildContext context) {
    sizeX = DisplayUtils.getSizeX() / 3.2;
    _enabled = widget.enabled;
    return _buildPanicButton();
  }

  Widget _buildPanicButton() {
    return Container(
        width: sizeX,
        height: sizeX * 1.5,
        decoration: BoxDecoration(
          color: _colorState,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: MaterialButton(
            onPressed: () {
              if (_enabled) {
                setState(() {
                  _buttonState = 1;
                  print("Bloqueando botones");
                  widget.blockButtons();
                  askForService();
                });
              } else if (_buttonState == 3) {
                //Abrir mapa
              }
            },
            child: _setBody()));
  }

  Widget _setBody() {
    Widget mainColumnPanicButton = Column(
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
                fontSize: 16.0,
                letterSpacing: 1.0,
                fontWeight: FontWeight.bold),
          )
        ]);

    switch (_buttonState) {
      case 0:
        return mainColumnPanicButton;
        break;
      case 1:
        return Stack(
          alignment: AlignmentDirectional.center,
          children: <Widget>[
            mainColumnPanicButton,
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              strokeWidth: 5.0,
            ),
          ],
        );
        break;
      case 2:
        return Stack(
          alignment: AlignmentDirectional.center,
          children: <Widget>[
            mainColumnPanicButton,
            Icon(
              Icons.check,
              color: Colors.white,
              size: (sizeX / 2.0),
            )
          ],
        );
        break;
      case 3:
        return mainColumnPanicButton;
        break;
      case 4:
        return mainColumnPanicButton;
        break;
      default:
        return mainColumnPanicButton;
        break;
    }
  }

  void askForService() {
    LocationRequest.getPosition().then((position) {
      print("Intentando obtener ubicacion");
      _request = new PanicRequest(
          id: "asdfg122321321",
          name: "Christopher Madrigal",
          number: "+523318529246",
          latitude: position.latitude,
          longitude: position.longitude,
          typeOfPanic: widget.typeOfAlert);
    }).catchError((e) {
      print("Error al obtener la ubicación... " + e.toString());
    }).whenComplete(() {
      if (_request != null) {
        sendRequest(_request.toJson()).then((response) {
          print("Intentando mandar petición");
          print(response);
          if (response) {
            setState(() {
              _buttonState = 2;
              _colorState = Colors.red[800];
              PushNotifications.addNotification(new Notifications(
                  status: 0,
                  onResponse: onResponse,
                  onComplete: onComplete,
                  typeOfAlert: widget.typeOfAlert));
            });
          } else {
            print("Error al mandar petición");
          }
        }).catchError((e) {
          print("Error al mandar petición: " + e.toString());
        });
      }
    });
  }

  Future<bool> sendRequest(json) async {
    bool success;
    var url = 'http://ptsv2.com/t/tofitah/post';
    var response = await http.post(url, body: json);
    if (response.statusCode == 200) {
      success = true;
    } else {
      success = false;
    }
    return success;
  }

  void onResponse() {
    if (_buttonState == 2)
      setState(() {
        _buttonState = 3;
        _colorState = Colors.yellow[800];
      });
  }

  void onComplete() {
    if (_buttonState == 3)
      setState(() {
        _buttonState = 4;
        _colorState = Colors.green[800];
      });
  }

  /*void _showDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Alert Dialog title"),
          content: new Text("Alert Dialog body"),
          actions: <Widget>[
            new FlatButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }*/
}
