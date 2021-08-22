import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  backgroundColor: const Color(0xffffffff),
  primaryColorLight: const Color(0xffffffff),
  primaryColorDark: const Color(0xff000000),
  primaryColor: const Color(0xffc5337a),
  highlightColor: const Color(0xffc4c4c4),
  appBarTheme: AppBarTheme(
    centerTitle: true,
    backgroundColor: const Color(0xffffffff),
    foregroundColor: const Color(0xff000000),
    iconTheme: IconThemeData(
      color: const Color(0xff000000),
    ),
  ),
  textSelectionTheme: const TextSelectionThemeData(
    cursorColor: Colors.black,
  ),
);
