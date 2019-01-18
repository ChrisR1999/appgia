import 'package:flutter/material.dart';

class DisplayUtils {

  static double sizeX;
  static double sizeY;

  DisplayUtils(BuildContext context){
    sizeX = (MediaQuery.of(context).size.shortestSide);
    sizeY = (MediaQuery.of(context).size.longestSide);
  }
}