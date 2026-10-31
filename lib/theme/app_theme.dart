import 'package:flutter/material.dart';

abstract final class AppTheme {
  static final Color opacityWhite = Color.fromARGB(204, 255, 255, 255);

  static final ThemeData light = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.deepPurpleAccent,
      brightness: Brightness.light,
    ),
    scaffoldBackgroundColor: const Color(0xFFF5F7FA),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.deepPurpleAccent,
      foregroundColor: opacityWhite,
      elevation: 0,
    ),
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: Colors.deepPurple.shade50,
      indicatorColor: Colors.deepPurple.shade100,
      labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
    ),
    listTileTheme: const ListTileThemeData(iconColor: Colors.deepPurpleAccent),
    textTheme: TextTheme(
      labelMedium: TextStyle(
        fontWeight: FontWeight.w100,
        fontFamily: 'CascadiaCode',
        color: Colors.black,
      ),
      labelLarge: TextStyle(
        fontWeight: FontWeight.w500,
        fontFamily: 'CascadiaCode',
        color: Colors.black,
      ),
      bodySmall: TextStyle(
        fontSize: 16,
        fontFamily: 'CascadiaCode',
        color: Colors.black,
      ),
      bodyMedium: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w300,
        fontFamily: 'CascadiaCode',
        color: Colors.white,
      ),
      bodyLarge: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w300,
        fontFamily: 'CascadiaCode',
      ),
      titleMedium: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        fontFamily: 'CascadiaCode',
      ),
      titleLarge: TextStyle(
          fontWeight: FontWeight.w900,
          fontFamily: 'CascadiaCode',
          fontSize: 24
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.black,
        minimumSize: Size(200, 40),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
      ),
    ),

    cardTheme: CardThemeData(
      color: const Color(0xFFF5F7FA),
    ),
  );

  static final ThemeData dark = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.deepPurple,
      brightness: Brightness.dark,
    ),
    scaffoldBackgroundColor: Colors.black45,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.deepPurple,
      foregroundColor: opacityWhite,
      elevation: 0,
    ),
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: Colors.deepPurple,
      indicatorColor: Colors.deepPurpleAccent,
      labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
    ),
    listTileTheme: const ListTileThemeData(
      iconColor: Colors.white,
      textColor: Colors.white70,
    ),
    textTheme: TextTheme(
      labelMedium: TextStyle(
        fontWeight: FontWeight.w100,
        fontFamily: 'CascadiaCode',
        color: opacityWhite,
      ),
      labelLarge: TextStyle(
        fontWeight: FontWeight.w500,
        fontFamily: 'CascadiaCode',
        color: opacityWhite,
      ),
      bodySmall: TextStyle(
        fontSize: 16,
        fontFamily: 'CascadiaCode',
        color: opacityWhite,
      ),
      bodyMedium: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w300,
        fontFamily: 'CascadiaCode',
        color: opacityWhite,
      ),
      bodyLarge: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w300,
        fontFamily: 'CascadiaCode',
      ),
      titleMedium: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        fontFamily: 'CascadiaCode',
      ),
      titleLarge: TextStyle(
          fontWeight: FontWeight.w900,
          fontFamily: 'CascadiaCode',
          fontSize: 24
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFF523093),
        minimumSize: Size(200, 40),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
      ),
    ),

    cardTheme: CardThemeData(
      color: Color(0xFF412675),
    ),
  );
}