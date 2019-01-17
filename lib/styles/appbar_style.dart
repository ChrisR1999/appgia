import 'package:app_trabajo/utilities/string_constants.dart';
import 'package:flutter/material.dart';

class AppBarWidget {
  static AppBar getAppBar() {
    return AppBar(
      title: Container(
          margin: EdgeInsets.only(left: 20.0),
          child: Text(
            StringConstants.appBarTitle,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25.0,
            ),
          )),
      backgroundColor: Colors.black,
    );
  }
}
