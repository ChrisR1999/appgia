import 'package:app_trabajo/utils/string_utils.dart';
import 'package:app_trabajo/styles/appbar_style.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: StringUtils.settingAppBarTitle,
      home: _SettingsScreen(),
    );
  }
}

class _SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarStyle.getSettingsAppBar(context),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          
        ],
      ),
    );
  }
}
