import 'package:flutter/material.dart';

class CurrentThemeData {
  static final theme = ThemeData(
      fontFamily: 'SFPro',
      textTheme: const TextTheme(
        headline1: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 28,
          letterSpacing: -0.4,
        ),
        headline2: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 22,
          letterSpacing: -0.4,
        ),
        subtitle1: TextStyle(
          color: Color(0xff979aab),
          fontWeight: FontWeight.w400,
          fontSize: 14,
          letterSpacing: -0.4,
        ),
        button: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
          fontSize: 18,
          letterSpacing: -0.4,
        ),
      ),
      scaffoldBackgroundColor: const Color(0xFFFFFFFF),
      colorScheme: const ColorScheme(
        brightness: Brightness.light,
        onBackground: Color(0xffe5e3eb),
        primaryVariant: Color(0xff505266),
        secondaryVariant: Color(0xff8C8C9B),
        onSurface: Color(0xFF585866),
        secondary: Color(0xFF8D8D9A),
        surface: Color(0xFF767680),
        onError: Colors.orange,
        onSecondary: Colors.white,
        primary: Color(0xff505266),
        error: Colors.orange,
        onPrimary: Colors.white,
        background: Color(0xFFFFFFFF),
      ));
}
