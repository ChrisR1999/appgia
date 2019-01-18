import 'package:flutter/material.dart';
import 'package:app_trabajo/styles/appbar_style.dart';
import 'package:app_trabajo/utils/string_utils.dart';
import 'package:app_trabajo/number_screen.dart';

class LoginSelect extends StatelessWidget {
  build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/loginselect/numberscreen': (context) => NumberScreen(),
      },
      home: _LoginSelect());
  }
}

class _LoginSelect extends StatelessWidget {
  void _setLogin(String opc, BuildContext context) {
    switch (opc) {
      case LoginConstants.googleLogin:
      Navigator.pushNamed(context, '/loginselect/numberscreen');
        break;
      case LoginConstants.iosLogin:
        break;
      case LoginConstants.corporativeLogin:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarStyle.getAppBar(),
        body: Center(child: _createLoginButtons(context)));
  }

  Widget _createLoginButtons(BuildContext context) {
    return Container(
        child: Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        FlatButton(
          onPressed: () {
            _setLogin(LoginConstants.googleLogin, context);
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
              _setLogin(LoginConstants.iosLogin, context);
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
                  _setLogin(LoginConstants.corporativeLogin, context);
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
}
