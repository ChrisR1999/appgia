import 'package:app_trabajo/utils/constants_utils.dart';
import 'package:flutter/material.dart';

abstract class AppBarWidget {
  static AppBar getAppBar() {
    return AppBar(
      title: Padding(
          padding: EdgeInsets.only(left: 20.0),
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

  static AppBar getSettingsAppBar(context) {
    return AppBar(
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        color: Colors.white,
        icon: Icon(
          Icons.keyboard_arrow_left,
          size: 40.0,
        ),
      ),
      title: Text(
        StringConstants.settingAppBarTitle,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 25.0,
        ),
      ),
      backgroundColor: Colors.black,
    );
  }
}
