import 'package:flutter/material.dart';

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.black,
    primarySwatch: MaterialColor(const Color(0xffd91a36).value, const {
      50: Color(0xfffce8eb),
      100: Color(0xfff7bbc4),
      200: Color(0xfff18d9c),
      300: Color(0xffec6074),
      400: Color(0xffe6324d),
      500: Color(0xffcd1933),
      600: Color(0xffcd1933),
      700: Color(0xff720e1c),
      800: Color(0xff440811),
      900: Color(0xff170306),
    }),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}
