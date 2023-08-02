import 'package:flutter/material.dart';

class SizeConfig {
  static MediaQueryData? _mediaQueryData;

  static double screenWidth = 0; // Width of the screen
  static double screenHeight = 0; // Height of the screen
  static double defaultSize = 0; // Default size of the screen
  static Orientation orientation = Orientation.portrait; // Default orientation

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData!.size.width;
    screenHeight = _mediaQueryData!.size.height;
    orientation = _mediaQueryData!.orientation;
  }
}
//get the proportionate height as per screen size

double getProportionateScreenHeight(double inputHeight) {
  double screenHeight = SizeConfig.screenHeight;
  // 812 is the layout height that designer use
  return (inputHeight / 812.0) * screenHeight;
}
//get the proportionate width as per screen size

double getProportionateScreenWidth(double inputWidth) {
  double screenWidth = SizeConfig.screenWidth;
  // 375 is the layout width that designer use
  return (inputWidth / 375.0) * screenWidth;
}
