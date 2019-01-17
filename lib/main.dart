import 'package:app_trabajo/utilities/string_constants.dart';
import 'package:flutter/material.dart';
import './main_app_activity.dart';

void main() {
  runApp(MainAppActivity());
}

class MyApp extends StatelessWidget {
  build(BuildContext context) {
    return MaterialApp(home: _MyApp());
  }
}

class _MyApp extends StatelessWidget {
  void _setLogin(String opc) {
    switch (opc) {
      case LoginConstants.googleLogin:
        break;
      case LoginConstants.iosLogin:
        break;
      case LoginConstants.corporativeLogin:
        break;
    }
  }

  Widget _createLoginButtons() {
    return Container(
        child: Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        FlatButton(
          onPressed: () {
            _setLogin(LoginConstants.googleLogin);
            print("GoogleLogin");
          },
          shape: CircleBorder(),
          splashColor: Colors.transparent,
          child: Image.asset(
            'images/googlelogin.png',
            height: 145.0,
            width: 145.0,
          ),
        ),
        FlatButton(
            onPressed: () {
              _setLogin(LoginConstants.iosLogin);
              print("IOSLogin");
            },
            shape: CircleBorder(),
            splashColor: Colors.transparent,
            child: Image.asset(
              'images/ioslogin.png',
              height: 145.0,
              width: 145.0,
            )),
        Container(
            width: 145.0,
            height: 145.0,
            child: FlatButton(
                onPressed: () {
                  _setLogin(LoginConstants.corporativeLogin);
                  print("CorporativeLogin");
                },
                color: Colors.black,
                shape: CircleBorder(),
                child: Image.asset(
                  'images/corporativelogin.png',
                  width: 130.0,
                  height: 130.0,
                ))),
      ],
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(StringConstants.appBarTitle),
          backgroundColor: Colors.black,
        ),
        body: Center(child: _createLoginButtons()));
  }
}
