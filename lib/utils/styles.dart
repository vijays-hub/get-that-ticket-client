import 'package:flutter/material.dart';

Color primary = const Color(
    0xFF687daf); // To be able to access outside the GlobalStyles class. (or any other class for that matter.)

class GlobalStyles {
  // Colors
  static Color primaryColor = primary;
  static Color textColor = const Color(0xFF3b3b3b);
  static Color bgColor = const Color(0xFFeeedf2);
  static Color orangeColor = const Color(0xFFF37B67);
  static Color khakiColor = const Color(0xFFd2bdd6);

  // Text Styles
  static TextStyle textStyle =
      TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: textColor);
  static TextStyle heading1Style =
      TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: textColor);
  static TextStyle heading2Style =
      TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: textColor);
  static TextStyle heading3Style = TextStyle(
      fontSize: 20, fontWeight: FontWeight.w600, color: Colors.grey.shade500);
  static TextStyle heading4Style = TextStyle(
      fontSize: 16, fontWeight: FontWeight.w500, color: Colors.grey.shade500);
}
