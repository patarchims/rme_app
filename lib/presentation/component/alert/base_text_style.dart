import 'package:flutter/material.dart';

enum FontStyle {
  thin,
  extralight,
  light,
  medium,
  regular,
  semibold,
  bold,
  extrabold,
  dark,
}

class BaseTextStyle {
  static FontWeight getFontWeight(FontStyle style) {
    switch (style) {
      case FontStyle.thin:
        return FontWeight.w100;
      case FontStyle.extralight:
        return FontWeight.w200;
      case FontStyle.light:
        return FontWeight.w300;
      case FontStyle.medium:
        return FontWeight.w400;
      case FontStyle.regular:
        return FontWeight.w500;
      case FontStyle.semibold:
        return FontWeight.w600;
      case FontStyle.bold:
        return FontWeight.w700;
      case FontStyle.extrabold:
        return FontWeight.w800;
      case FontStyle.dark:
        return FontWeight.w900;
    }
  }

  static TextStyle style(
      {FontStyle style = FontStyle.regular,
      double fontSize = 14.0,
      Color color = const Color.fromARGB(255, 76, 75, 94)}) {
    return TextStyle(
      fontSize: fontSize,
      color: color,
      fontWeight: BaseTextStyle.getFontWeight(style),
    );
  }
}
