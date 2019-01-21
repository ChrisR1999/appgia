import 'package:flutter/material.dart';

class DisplayUtils {
  static double _sizeX;
  static double _sizeY;

  DisplayUtils(BuildContext context) {
    _sizeX = (MediaQuery.of(context).size.shortestSide);
    _sizeY = (MediaQuery.of(context).size.longestSide);
  }

  static double getSizeX() {return _sizeX;}
  static double getSizeY() {return _sizeY;}
}
