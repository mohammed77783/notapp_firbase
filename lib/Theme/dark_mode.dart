import 'package:flutter/material.dart';

ThemeData dark_mode=ThemeData(
brightness: Brightness.dark
,colorScheme: ColorScheme.dark(
  background: Colors.grey.shade900,
  primary: Colors.grey.shade200,
  secondary: Colors.grey.shade700,
  inversePrimary: Colors.grey.shade500 
),
textTheme:  ThemeData.light().textTheme.apply(
  bodyColor: Colors.grey[300],
  displayColor: Colors.white
)
);