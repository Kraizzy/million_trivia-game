import 'package:flutter/material.dart';

class Responsive {
  static late double screenWidth;
  static late double screenHeight;

  static void init(BuildContext context) {
    final size = MediaQuery.of(context).size;
    screenWidth = size.width;
    screenHeight = size.height;
  }

  static double w(double value) => screenWidth * value;
  static double h(double value) => screenHeight * value;
}
