import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryColor = Color(0xFF0C54BE);
  static const Color secondaryColor = Color(0xFF303F60);
  static const Color backgroundColor = Color(0xFFF5F9FD);
  static const Color surfaceColor = Color(0xFFCED3DC);

  static const String fontFamily = 'Poppins';

  static const TextStyle headlineStyle = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.bold,
    fontSize: 24,
    color: secondaryColor,
  );

  static const TextStyle bodyStyle = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.normal,
    fontSize: 16,
    color: secondaryColor,
  );

  static TextStyle buttonStyle = const TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w500,
    fontSize: 16,
    color: Colors.white,
  );

  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: primaryColor,
      scaffoldBackgroundColor: backgroundColor,
      fontFamily: fontFamily,
      textTheme: TextTheme(
        headlineLarge: headlineStyle,
        bodyLarge: bodyStyle,
        labelSmall: buttonStyle,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          foregroundColor: Colors.white,
          textStyle: buttonStyle,
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        fillColor: surfaceColor,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        labelStyle: const TextStyle(color: secondaryColor),
      ),
    );
  }
}
