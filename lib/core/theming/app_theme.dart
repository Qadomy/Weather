import 'package:flutter/material.dart';
import 'package:weather_warba_bank/core/theming/colors.dart';

ThemeData appTheme() {
  return ThemeData(
    scaffoldBackgroundColor: ColorsManager.white,
    appBarTheme: const AppBarTheme(
      color: Colors.transparent,
      elevation: 0,
    ),
  );
}

ThemeData appDarkTheme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.grey.shade900,
    appBarTheme: const AppBarTheme(
      color: Colors.black,
      elevation: 0,
    ),
    colorScheme: const ColorScheme.dark(),
  );
}
