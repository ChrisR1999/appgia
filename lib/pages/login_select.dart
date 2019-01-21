import 'package:flutter/material.dart';
import 'package:app_trabajo/widgets/appbar.dart';
import 'package:app_trabajo/styles/themedata_style.dart';
import 'package:app_trabajo/utils/constants_utils.dart';
import 'package:app_trabajo/login/googlelogin.dart';
import 'package:app_trabajo/pages/number_screen.dart';
import 'package:app_trabajo/pages/corporative_login.dart';
import 'package:app_trabajo/shared_preferences/sharedpreferences.dart';



class LoginSelect extends StatelessWidget {
  build(BuildContext context) {
    return MaterialApp(
        theme: ThemeDataStyle.getThemeData(),
        routes: {
          '/loginselect/numberscreen': (context) => NumberScreen(),
        },
        home: LoginSelectPage());
  }
}

class LoginSelectPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginSelectPage();
  }
}

class _LoginSelectPage extends State<LoginSelectPage> {

  void _setLogin(String opc) {
    bool loginStatus;
    switch (opc) {
      case LoginConstants.googleLogin:
        GoogleLogin googleLogin = new GoogleLogin();
        googleLogin.signIn().then((value) {
          loginStatus = value;
          if (loginStatus) {  
            SharedGia.setActiveLogin(SharedConstants.googleLogin);
            _onLoading();
          }
        });
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
        appBar: AppBarWidget.getAppBar(),
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

  void _onLoading() {
    showDialog(
      context: context,
      barrierDismissible: false,
      child: Dialog(
        child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircularProgressIndicator(
                  backgroundColor: Colors.black,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Text(StringConstants.loading),
                )
              ],
            )),
      ),
    );
    Future.delayed(new Duration(seconds: 3), () {
      Navigator.of(context, rootNavigator: true).pop();
      Navigator.pushNamed(context, '/loginselect/numberscreen');
    });
  }
}
