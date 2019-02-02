import 'package:flutter/material.dart';
import 'package:app_trabajo/pages/settings_screen.dart';
import 'package:app_trabajo/widgets/appbar.dart';
import 'package:app_trabajo/utils/display_utils.dart';
import 'package:app_trabajo/utils/constants_utils.dart';
import 'package:app_trabajo/widgets/panic_button_1.dart';
import 'package:app_trabajo/notifications/push_notification.dart';

class MainScreen extends StatefulWidget {
  PushNotifications _pushNotifications;
  MainScreen() {
    _pushNotifications = new PushNotifications();
  }
  @override
  State<StatefulWidget> createState() {
    return _MainScreenState();
  }
}

class _MainScreenState extends State<MainScreen> {
  double sizeX;
  bool _enableButton;

  @override
  void initState() {
    super.initState();
    _enableButton = true;
  }

  @override
  Widget build(BuildContext context) {
    new DisplayUtils(context);
    sizeX = (DisplayUtils.getSizeX()) / 3.0;
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBarWidget.getAppBar(),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            _buildPanicButtons(sizeX),
            _buildServiceButtons(sizeX),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomBar(sizeX, context),
    );
  }

  Widget _buildPanicButtons(double sizeX) {
    return Container(
      child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage("images/escalera.jpg"),
                  fit: BoxFit.cover,
                )),
                padding: EdgeInsets.only(top: 12.0, bottom: 18.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    PanicButton(
                      enabled: _enableButton,
                      imageRoute: PanicConstants.healthImageRoute,
                      label: PanicConstants.healthPanicLabel,
                      typeOfAlert: PanicConstants.healthPanicIndicator,
                      blockButtons: _blockButtons,
                      enableButtons: _enableButtons
                    ),
                    PanicButton(
                      enabled: _enableButton,
                      imageRoute: PanicConstants.securityImageRoute,
                      label: PanicConstants.securityPanicLabel,
                      typeOfAlert: PanicConstants.securityPanicIndicator,
                      blockButtons: _blockButtons,
                      enableButtons: _enableButtons
                    ),
                    PanicButton(
                      enabled: _enableButton,
                      imageRoute: PanicConstants.protectionImageRoute,
                      label: PanicConstants.protectionPanicLabel,
                      typeOfAlert: PanicConstants.protectionPanicIndicator,
                      blockButtons: _blockButtons,
                      enableButtons: _enableButtons
                    ),
                  ],
                )),
            Row(children: <Widget>[
              Expanded(
                child: Image.asset(
                  'images/bottomPanic.png',
                  height: sizeX - (sizeX * 0.10),
                  fit: BoxFit.fill,
                ),
              )
            ])
          ]),
    );
  }

  Widget _buildServiceButtons(sizeX) {
    return Container(
      margin: EdgeInsets.only(left: 15.0, right: 15.0),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  RawMaterialButton(
                    fillColor: Colors.black,
                    padding: const EdgeInsets.all(15.0),
                    shape: new CircleBorder(),
                    elevation: 2.0,
                    child: new Icon(
                      Icons.headset_mic,
                      color: Colors.white,
                      size: sizeX / 4.5,
                    ),
                    onPressed: () {},
                  ),
                  Padding(
                      padding: EdgeInsets.only(top: 10.0),
                      child: Text(
                        "Llamar\nOperador",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 18.0,
                            letterSpacing: 0.3,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Rock Salt'),
                      ))
                ]),
            Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  RawMaterialButton(
                    fillColor: Colors.black,
                    padding: const EdgeInsets.all(15.0),
                    shape: new CircleBorder(),
                    elevation: 2.0,
                    child: new Icon(
                      Icons.add_location,
                      color: Colors.white,
                      size: sizeX / 4.5,
                    ),
                    onPressed: () {},
                  ),
                  Padding(
                      padding: EdgeInsets.only(top: 10.0),
                      child: Text(
                        "Enviar\nUbicación",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18.0,
                          letterSpacing: 0.3,
                          fontWeight: FontWeight.bold,
                        ),
                      ))
                ]),
            Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  RawMaterialButton(
                    fillColor: Colors.black,
                    padding: const EdgeInsets.all(15.0),
                    shape: new CircleBorder(),
                    elevation: 2.0,
                    child: new Icon(
                      Icons.photo_camera,
                      color: Colors.white,
                      size: sizeX / 4.5,
                    ),
                    onPressed: () {},
                  ),
                  Padding(
                      padding: EdgeInsets.only(top: 10.0),
                      child: Text(
                        "Tomar\nFotografía",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18.0,
                          letterSpacing: 0.3,
                          fontWeight: FontWeight.bold,
                        ),
                      ))
                ])
          ]),
    );
  }

  Widget _buildBottomBar(sizeX, context) {
    return BottomAppBar(
      color: Colors.black,
      elevation: 4.0,
      child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.home),
              color: Colors.white,
              iconSize: sizeX / 3.5,
              tooltip: 'Home',
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.message),
              color: Colors.white,
              iconSize: sizeX / 3.5,
              tooltip: 'Messages',
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.tune),
              color: Colors.white,
              iconSize: sizeX / 3.5,
              tooltip: 'Settings',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SettingsScreen()),
                );
              },
            ),
          ]),
    );
  }

  void _enableButtons() {
    setState(() {
      _enableButton = true;
    });
  }

  void _blockButtons() {
    setState(() {
      _enableButton = false;
    });
  }
}
