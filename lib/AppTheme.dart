import 'package:flutter/material.dart';

// https://itnext.io/app-theming-in-flutter-dark-mode-light-mode-27d9adf3cee
const PRIMARYCOLOR = Colors.purple;
const SECONDARYCOLOR = Colors.white;

class AppTheme {
  AppTheme._();

  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: PRIMARYCOLOR,
    appBarTheme: AppBarTheme(
      color: Colors.purple,
      iconTheme: IconThemeData(
        color: SECONDARYCOLOR,
      ),
    ),
    cardTheme: CardTheme(
      color: PRIMARYCOLOR,
    ),
    iconTheme: IconThemeData(
      color: Colors.white54,
    ),
    textTheme: TextTheme(
      headline1: TextStyle(
        color: Colors.white,
        fontSize: 20.0,
      ),
      subtitle1: TextStyle(
        color: Colors.white70,
        fontSize: 18.0,
      ),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: AppBarTheme(
      color: Colors.black,
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
      textTheme: TextTheme(
        headline1: TextStyle(
          color: Colors.white,
          fontSize: 20.0,
        ),
        subtitle1: TextStyle(
          color: Colors.white70,
          fontSize: 18.0,
        ),
      ),
    ),
  );
}
