import 'package:flutter/material.dart';
import 'package:app_trabajo/utils/display_utils.dart';

class PanicButton extends StatefulWidget {
  final String label;
  final String typeOfAlert;
  final String imageRoute;

  PanicButton({this.label, this.typeOfAlert, this.imageRoute});

  @override
  State<StatefulWidget> createState() {
    return _PanicButton();
  }
}

class _PanicButton extends State<PanicButton> {
  Color _colorState;
  bool _enabled;

  @override
  void initState() {
    _colorState = Colors.white;
    _enabled = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double sizeX = DisplayUtils.getSizeX() / 3.0;

    return Container(
        height: sizeX * 1.2,
        width: (sizeX - (sizeX * 0.16)),
        decoration: BoxDecoration(color: _colorState),
        child: RawMaterialButton(
            onPressed: () {
              setState(() {
                if (_enabled) {
                  print(widget.typeOfAlert);
                  _colorState = Colors.red[700];
                  _enabled = false;
                } else {
                  return null;
                }
              });
            },
            highlightColor: Colors.transparent,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Image.asset(
                    widget.imageRoute,
                    width: (sizeX - (sizeX * 0.3)),
                    fit: BoxFit.cover,
                  ),
                  Text(
                    widget.label,
                    style: TextStyle(fontSize: 18.0, letterSpacing: 0.2, fontWeight: FontWeight.bold),
                  )
                ])));
  }
}
