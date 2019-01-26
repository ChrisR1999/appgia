import 'package:flutter/material.dart';
import 'package:app_trabajo/widgets/appbar.dart';
import 'package:app_trabajo/utils/constants_utils.dart';
import 'package:app_trabajo/login/googlelogin.dart';
import 'package:app_trabajo/pages/number_screen.dart';
import 'package:app_trabajo/pages/corporative_login.dart';
import 'package:app_trabajo/utils/display_utils.dart';
import 'package:app_trabajo/shared_preferences/sharedpreferences.dart';


class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginScreen();
  }
}

class _LoginScreen extends State<LoginScreen> {
  double sizeY = DisplayUtils.getSizeY() / 3.6;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarWidget.getAppBar(),
        body: Builder(builder: (BuildContext contextS) {
          return Center(child: _createLoginButtons(contextS));
        }));
  }

  Widget _createLoginButtons(contextS) {
    return Container(
        child: Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        FlatButton(
          onPressed: () {
            _setLogin(LoginConstants.googleLogin, contextS);
            print("GoogleLogin");
          },
          shape: CircleBorder(),
          splashColor: Colors.transparent,
          child: Image.asset(
            'images/googlelogin.png',
            width: sizeY,
            height: sizeY,
          ),
        ),
        FlatButton(
            onPressed: () {
              _setLogin(LoginConstants.iosLogin, contextS);
              print("IOSLogin");
            },
            shape: CircleBorder(),
            splashColor: Colors.transparent,
            child: Image.asset(
              'images/ioslogin.png',
              width: sizeY,
              height: sizeY,
            )),
        FlatButton(
            onPressed: () {
              _setLogin(LoginConstants.corporativeLogin, contextS);
              print("CorporativeLogin");
            },
            shape: CircleBorder(),
            splashColor: Colors.transparent,
            child: Image.asset(
              'images/corporativelogin.png',
              width: sizeY,
              height: sizeY,
            )),
      ],
    ));
  }

  void _setLogin(String opc, contextS) {
    bool loginStatus;
    switch (opc) {
      case LoginConstants.googleLogin:
        GoogleLogin googleLogin = new GoogleLogin();
        googleLogin.signIn().then((value) {
          loginStatus = value;
          if (loginStatus) {
            SharedGia.setActiveLogin(SharedConstants.googleLogin);
            _callSnackBaronLoading(contextS);
          }
        });
        break;
      case LoginConstants.iosLogin:
        break;
      case LoginConstants.corporativeLogin:
        break;
    }
  }

  void _callSnackBaronLoading(contextS) {
    Scaffold.of(contextS)
        .showSnackBar(SnackBar(content: Text(StringConstants.loginMessage)));
    Future.delayed(new Duration(seconds: 3), () {
      Scaffold.of(contextS).hideCurrentSnackBar();
      Navigator.of(context).pop();
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => NumberScreen()),
      );
    });
  }
}
