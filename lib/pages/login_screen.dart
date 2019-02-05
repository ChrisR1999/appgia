import 'package:flutter/material.dart';
import 'package:app_trabajo/widgets/appbar.dart';
import 'package:app_trabajo/utils/constants_utils.dart';
import 'package:app_trabajo/login/googlelogin.dart';
import 'package:app_trabajo/pages/number_screen.dart';
import 'package:app_trabajo/pages/corporative_login_screen.dart';
import 'package:app_trabajo/utils/display_utils.dart';
import 'package:app_trabajo/sharedpreferences/sharedpreferences.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginScreen();
  }
}

class _LoginScreen extends State<LoginScreen> {
  double sizeY;
  BuildContext scaffoldContext;

  @override
  Widget build(BuildContext context) {
    new DisplayUtils(context);
    sizeY = DisplayUtils.getSizeY() / 3.6;
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBarWidget.getAppBar(),
        body: Builder(builder: (BuildContext scaffoldContext) {
          this.scaffoldContext = scaffoldContext;
          return Center(child: _createLoginButtons());
        }));
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
            width: sizeY,
            height: sizeY,
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
              width: sizeY,
              height: sizeY,
            )),
        FlatButton(
            onPressed: () {
              _setLogin(LoginConstants.corporativeLogin);
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

  void _setLogin(String opc) {
    bool loginStatus;
    switch (opc) {
      case LoginConstants.googleLogin:
        GoogleLogin googleLogin = new GoogleLogin();
        googleLogin.signIn().then((value) {
          loginStatus = value;
          if (loginStatus) {
            SharedGia.setActiveLogin(SharedConstants.googleLogin);
            _callSnackBaronLoading();
          }
        });
        break;
      case LoginConstants.iosLogin:
        break;
      case LoginConstants.corporativeLogin:
        break;
    }
  }

  void _callSnackBaronLoading() {
    Scaffold.of(scaffoldContext)
        .showSnackBar(SnackBar(content: Text(StringConstants.loginMessage)));
    Future.delayed(new Duration(seconds: 3), () {
      Scaffold.of(scaffoldContext).hideCurrentSnackBar();
      Navigator.of(context).pop();
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => NumberScreen()),
      );
    });
  }
}
