import 'dart:ui';
import 'package:flutter/material.dart';

class ColorConstant {
  static Color gray500 = fromHex('#949c9e');

  static Color black90066 = fromHex('#66000000');

  static Color black900 = fromHex('#000000');

  static Color bluegray400 = fromHex('#888888');

  static Color blue500 = fromHex('#1da1f2');

  static Color blueGray900 = fromHex('#323238');

  static Color whiteA700 = fromHex('#ffffff');

  static Color gray300 = fromHex('#e5e5e5');

  static Color blue50 = fromHex('#edf8ff');

  static Color gray100 = fromHex('#f2f2f2');

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
