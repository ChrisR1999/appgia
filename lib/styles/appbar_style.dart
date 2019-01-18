import 'package:app_trabajo/utils/string_utils.dart';
import 'package:flutter/material.dart';

class AppBarStyle {
  static AppBar getAppBar() {
    return AppBar(
      title: Container(
          margin: EdgeInsets.only(left: 20.0),
          child: Text(
            StringUtils.appBarTitle,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25.0,
            ),
          )),
      backgroundColor: Colors.black,
    );
  }

  static AppBar getSettingsAppBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        color: Colors.black,
        icon: Icon(Icons.arrow_back),
      ),
      title: Padding(
          padding: EdgeInsets.only(left: 20.0),
          child: Text(
            StringUtils.appBarTitle,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25.0,
            ),
          )),
      backgroundColor: Colors.black,
    );
  }
}
