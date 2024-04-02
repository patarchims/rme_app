import 'package:flutter/material.dart';

class ThemeColor {
  static const Color errorColor = Color(0xFFBF2C20);
  static const Color successColor = Color(0xFF1EA444);
  static const Color primaryColor = Color(0xFF0066CB);
  static const Color mainMenuColor = Color(0xFF124A6C);
  static const Color whiteColor = Colors.white;
  static const Color blackColor = Colors.black;
  static const Color blueColor = Color(0xFF1D427C);
  static const Color greyColor = Color(0xFFB4B7BC);
  static const Color darkGreyColor = Color(0xFFC4C4C4);
  static const Color darkGreyColor2 = Color(0xFF5A5858);
  static const Color orangeColor = Color(0xFFFFB55F);
  static const Color softBlue = Color(0xFFF6F7FC);
  static const Color dangerColor = Color(0xFFFF3A3A);
  static const Color redColor = Color(0xFFDA261B);
  static const Color primaryGreenColor = Color(0xFF21461E);

  static const Color greenColor = Color(0xFF0B6E08);

  static Color bgColor = const Color(0xFFF6F6F6);
  static Color lightGreyColor = const Color(0xFFEEEEEE).withOpacity(0.3);
  static Color lightGreyColor2 = const Color(0xFFF8F8F8);
  static Color darkColor = const Color(0xFF20252A);
  static Color lightGrey = const Color(0xFFEEEEEE);
  static Color yellowColor = const Color(0xFFFFD52A);
  static Color transparentColor = const Color(0xFFFFFFFF).withOpacity(0.5);

  static const MaterialColor darkBlueColor =
      MaterialColor(0xFF005CB0, <int, Color>{
    50: Color(0xFF00539e), // 10%
    100: Color(0xFF004a8d), //20%
    200: Color(0xFF00407b), //30%
    300: Color(0xFF00376a), //40%
    400: Color(0xFF002e58), //50%
    500: Color(0xFF002546), //60%
    600: Color(0xFF001c35), //70%
    700: Color(0xFF001223), //80%
    800: Color(0xFF000912), //90%
    900: Color(0xFF000000), //100%
  });
}
