import 'package:flutter/material.dart';
import 'package:app_trabajo/pages/login_select.dart';
import 'package:app_trabajo/pages/main_screen.dart';
import 'package:app_trabajo/permissions/permissions.dart';
import 'package:app_trabajo/login/login_manager.dart';
import 'package:simple_permissions/simple_permissions.dart';
import 'package:app_trabajo/styles/themedata_style.dart';

void main() async {
  LoginManager _loginManager = new LoginManager();
  Permissions _permissions =
      new Permissions(
        permissionWanted: Permission.AccessFineLocation
      );
  if(!(await _permissions.checkPermission())){
    _permissions.requestPermission();
  }
  
  if (await _loginManager.logIn())
    runApp(MaterialApp(
      theme: ThemeDataStyle.getThemeData()      ,
      home: MainScreen(),
    ));
  else
    runApp(MaterialApp(
      home: LoginSelect(),
    ));
}
