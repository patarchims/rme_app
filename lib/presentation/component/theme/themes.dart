// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:hms_app/presentation/component/theme/colors.dart';

abstract class Themes {
  Themes._();

  static ThemeData light = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    hoverColor: ApplicationColors.black,
    focusColor: ApplicationColors.white,
    hintColor: ApplicationColors.gallery,
    appBarTheme: const AppBarTheme(
      color: ApplicationColors.gallery,
    ),
    primaryColor: ApplicationColors.white,
    scaffoldBackgroundColor: ApplicationColors.gallery,
    cardColor: ApplicationColors.white,
    textTheme: buildTextTheme(const RTypographyColors.light()),
  );

  static ThemeData dark = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    hoverColor: ApplicationColors.white,
    focusColor: ApplicationColors.cornflowerBlue,
    hintColor: ApplicationColors.tundora,
    primarySwatch: ApplicationColors.grey,
    dividerColor: ApplicationColors.black12,
    cardColor: ApplicationColors.darkCyan,
    primaryColor: ApplicationColors.codGray,
    appBarTheme: const AppBarTheme(
      color: ApplicationColors.tundora,
    ),
    scaffoldBackgroundColor: ApplicationColors.lightCyan,
    textTheme: buildTextTheme(const RTypographyColors.dark()),
  );

  static TextTheme buildTextTheme(RTypographyColors textColor) {
    return const TextTheme();
  }
}
