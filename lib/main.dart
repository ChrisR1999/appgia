import 'package:flutter/material.dart';
import 'package:app_trabajo/pages/login_screen.dart';
import 'package:app_trabajo/pages/main_screen.dart';
import 'package:app_trabajo/utils/constants_utils.dart';
import 'package:app_trabajo/pages/number_screen.dart';
import 'package:app_trabajo/permissions/permissions.dart';
import 'package:app_trabajo/shared_preferences/sharedpreferences.dart';
import 'package:app_trabajo/login/login_manager.dart';
import 'package:simple_permissions/simple_permissions.dart';
import 'package:app_trabajo/styles/themedata_style.dart';

void main() async {
  await SharedGia.initShared();

  LoginManager _loginManager = new LoginManager();
  Permissions _permissions =
      new Permissions(permissionWanted: Permission.AccessFineLocation);
  if (!(await _permissions.checkPermission())) {
    _permissions.requestPermission();
  }

  if (await _loginManager.isUserLogged()) {
    if (await _loginManager.isUserLoggedinFirebase()) {
      runApp(MaterialApp(
        debugShowCheckedModeBanner: false,
        title: StringConstants.appBarTitle,
        theme: ThemeDataStyle.getThemeData(),
        home: LoginScreen(),
      ));
    } else {
      runApp(MaterialApp(
        debugShowCheckedModeBanner: false,
        title: StringConstants.appBarTitle,
        theme: ThemeDataStyle.getThemeData(),
        home: NumberScreen(),
      ));
    }
  } else {
    runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: StringConstants.appBarTitle,
      theme: ThemeDataStyle.getThemeData(),
      home: LoginScreen(),
    ));
  }
}

/*sendRequest() async {

  var client = new RetryClient(new http.Client());
    Map data = {
       'apikey': '12345678901234567890'
    };

    var url = 'https://pae.ipportalegre.pt/testes2/wsjson/api/app/ws-authenticate';
    http.post(url, body: data)
        .then((response) {
      print("Response status: ${response.statusCode}");
      print("Response body: ${response.body}");
    });
  }*/
