import 'package:flutter/material.dart';
import 'package:app_trabajo/pages/login_select.dart';
import 'package:app_trabajo/pages/main_screen.dart';
import 'package:app_trabajo/login/login_manager.dart';

void main() async {
  LoginManager loginManager = new LoginManager();
  if(await loginManager.logIn())
    runApp(MaterialApp(
      home: MainScreen(),
    ));
  else
    runApp(MaterialApp(
      home: LoginSelect(),
    ));
}
