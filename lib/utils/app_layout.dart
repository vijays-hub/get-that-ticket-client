import 'package:flutter/material.dart';
import 'package:get/get.dart';

// To access outside the class.
double generateDynamicHeight(double pixels) {
  return AppLayout.getDynamicHeight(pixels);
}

double generateDynamicWidth(double pixels) {
  return AppLayout.getDynamicHeight(pixels);
}

class AppLayout {
  static Size getViewportSize(BuildContext context) =>
      MediaQuery.of(context).size;

  static double getViewportHeight() {
    return Get.height;
  }

  static double getViewportWidth() {
    return Get.width;
  }

  // returns the required dynamic height depending on the viewport.
  static double getDynamicHeight(double pixels) {
    double viewportHeight = getViewportHeight();
    double proportion = viewportHeight / pixels; // Gets the screen proportion.
    return viewportHeight /
        proportion; // Returns the equivalent height for particular screen. (Ex: 200px can be smaller for smaller screens and higher for higher screens>)
  }

  // returns the required dynamic width depending on the viewport.
  static double getDynamicWidth(double pixels) {
    double viewportWidth = getViewportWidth();
    double proportion = viewportWidth / pixels;
    return viewportWidth / proportion;
  }
}
