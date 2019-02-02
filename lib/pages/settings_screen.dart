import 'package:app_trabajo/styles/themedata_style.dart';
import 'package:app_trabajo/utils/constants_utils.dart';
import 'package:app_trabajo/widgets/appbar.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        title: StringConstants.appBarTitle,
        theme: ThemeDataStyle.getThemeData(),
        
        
        home: Scaffold(
            appBar: AppBarWidget.getSettingsAppBar(context),
            body: Padding(
              padding: EdgeInsets.only(top: 10.0),
              child: ListView(
                children: <Widget>[
                  ListTile(
                    onTap: () {},
                    enabled: true,
                    leading: Icon(
                      Icons.person_outline,
                      color: Colors.black,
                      size: 50.0,
                    ),
                    title: Text(
                      'Mis Generales',
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(top: 10.0),
                      child: ListTile(
                        onTap: () {},
                        enabled: true,
                        leading: Icon(
                          Icons.directions_run,
                          color: Colors.black,
                          size: 50.0,
                        ),
                        title: Text(
                          'Contacto de Emergencía',
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.w600),
                        ),
                      )),
                  Padding(
                      padding: EdgeInsets.only(top: 10.0),
                      child: ListTile(
                        onTap: () {},
                        enabled: true,
                        leading: Icon(
                          Icons.phone_android,
                          color: Colors.black,
                          size: 50.0,
                        ),
                        title: Text(
                          'Acerca de la Aplicación',
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.w600),
                        ),
                      )),
                ],
              ),
            )));
  }
}
