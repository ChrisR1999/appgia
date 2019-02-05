import 'package:flutter/material.dart';
import 'package:app_trabajo/widgets/appbar.dart';
import 'package:app_trabajo/utils/user_utils.dart';
import 'package:app_trabajo/utils/rescatist_utils.dart';
import 'package:app_trabajo/utils/display_utils.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  @override
  State createState() => MapScreenState();
}

class MapScreenState extends State<MapScreen> {
  GoogleMapController mapController;
  double sizeX;
  double sizeY;
  int estimateTime;
  int distance;

  @override
  void initState() {
    super.initState();

    sizeX = DisplayUtils.getSizeX();
    sizeY = DisplayUtils.getSizeY();
    distance = RescatistUtils.distance;
    estimateTime = RescatistUtils.estimateTime;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget.getSMapAppBar(context),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Container(
            height: (sizeY * 0.72),
            width: sizeX,
            child: GoogleMap(
              onMapCreated: _onMapCreated,
            ),
          ),
          Expanded(
              child: Container(
            padding: EdgeInsets.only(left: 20.0, right: 20.0),
            width: sizeX,
            height: (sizeY * 0.15),
            alignment: Alignment(0.0, 0.0),
            decoration: BoxDecoration(
              color: Color(0xFF9E1B3F),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                    "Ayuda llegando en: $estimateTime mins\n" + 
                    "Distancia: $distance KM",
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.white
                    )),
                    Image.asset("images/sirena.png",
                    width: 48,height: 48,)
              ],
            ),
          ))
        ],
      ),
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    List<LatLng> markers = <LatLng>[
      LatLng(UserUtils.latitude, UserUtils.longitude),
      LatLng(RescatistUtils.latitude, RescatistUtils.longitude),
      LatLng(((RescatistUtils.latitude + UserUtils.latitude) / 2.0),
          ((RescatistUtils.longitude + UserUtils.longitude) / 2.0)),
    ];
    setState(() {
      mapController = controller;
      mapController.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(
          bearing: 0.0,
          target: markers[2],
          tilt: 0.0,
          zoom: 12.0,
        ),
      ));
      mapController
          .addMarker(MarkerOptions(position: markers[0], visible: true));
      mapController
          .addMarker(MarkerOptions(position: markers[1], visible: true));
    });
  }
}
