import 'package:flutter/material.dart';

abstract class ThemeDataStyle {
  static ThemeData getThemeData() {
    return ThemeData(
      primarySwatch: Colors.grey,
      primaryTextTheme: TextTheme(
        title: TextStyle(color: Colors.white),
      ),
      fontFamily: 'Roboto',

    );
  }
}
