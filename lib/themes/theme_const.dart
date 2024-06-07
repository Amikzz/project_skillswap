import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    background: Colors.white,
    primary: Colors.grey.shade400,
    onPrimary: Colors.black,
    secondary: Colors.grey.shade600,
    onSecondary: Colors.white,
  )
);

ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    background: Colors.black,
    primary: Colors.grey.shade900,
    onPrimary: Colors.white,
    secondary: Colors.grey.shade600,
    onSecondary: Colors.grey.shade900,
  )
);