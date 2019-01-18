import 'package:app_trabajo/styles/appbar_style.dart';
import 'package:app_trabajo/options.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(routes: {
      '/loginselect/numberscreen/numberverification/mainscreen/settings':
          (context) => SettingsScreen(),
    }, home: _MainScreen());
  }
}

class _MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double sizeX = (MediaQuery.of(context).size.shortestSide / 3.0);

    return Scaffold(
      appBar: AppBarStyle.getAppBar(),
      body: Center(
          child: Container(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            _buildPanicButtons(sizeX),
            _buildServiceButtons(sizeX),
          ],
        ),
      )),
      bottomNavigationBar: _buildBottomBar(sizeX),
    );
  }

  Widget _buildPanicButtons(double sizeX) {
    return Container(
      decoration: BoxDecoration(color: Colors.pink[800]),
      child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
        Container(
            padding: EdgeInsets.only(top: 12.0, bottom: 18.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                    height: sizeX * 1.2,
                    width: (sizeX - (sizeX * 0.16)),
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: RawMaterialButton(
                        onPressed: () {
                          print('Salud');
                        },
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Image.asset(
                                'images/salud.png',
                                width: (sizeX - (sizeX * 0.3)),
                                fit: BoxFit.cover,
                              ),
                              Text(
                                "Salud",
                                style: TextStyle(
                                    fontSize: 18.0, letterSpacing: 0.2),
                              )
                            ]))),
                Container(
                    height: sizeX * 1.2,
                    width: (sizeX - (sizeX * 0.16)),
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: RawMaterialButton(
                        onPressed: () {
                          print('Guardia');
                        },
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Image.asset('images/guardia.png',
                                  width: (sizeX - (sizeX * 0.5)),
                                  fit: BoxFit.cover),
                              Text(
                                "Seguridad",
                                style: TextStyle(
                                    fontSize: 18.0, letterSpacing: 0.2),
                              )
                            ]))),
                Container(
                    height: sizeX * 1.2,
                    width: (sizeX - (sizeX * 0.16)),
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: RawMaterialButton(
                        onPressed: () {
                          print('Protección civil');
                        },
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Image.asset('images/pCivil.png',
                                  width: (sizeX - (sizeX * 0.3)),
                                  fit: BoxFit.cover),
                              Text(
                                "Prot. Civil",
                                style: TextStyle(
                                    fontSize: 18.0, letterSpacing: 0.2),
                              )
                            ]))),
              ],
            )),
        Row(children: <Widget>[
          Expanded(
            child: Image.asset(
              'images/bottomPanic.png',
              height: sizeX * 0.8,
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
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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

  Widget _buildBottomBar(sizeX) {
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
              icon: Icon(Icons.settings),
              color: Colors.white,
              iconSize: sizeX / 3.5,
              tooltip: 'Settings',
              onPressed: () {},
            ),
          ]),
    );
  }
}
