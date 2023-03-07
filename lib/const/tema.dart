import 'package:flutter/material.dart';

class Tema {
  ThemeData themedata = ThemeData(
    appBarTheme: AppBarTheme(backgroundColor: Color(0xFF1F1F1F)),
    colorScheme: ColorScheme.fromSwatch()
        .copyWith(error: Color(0xFFFE3A30))
        .copyWith(background: Color(0xFF404040))
        .copyWith(tertiary: Color(0xFF1F1F1F)),
    primaryColor: Color(0xFFD7FC70),
    fontFamily: 'poppins',
    // textTheme: const TextTheme(
    //   displayLarge: TextStyle(fontSize: 72.0, color: Colors.white),
    //   displayMedium: TextStyle(fontSize: 48.0, color: Colors.white),
    //   displaySmall: TextStyle(fontSize: 36.0, color: Colors.white),
    //   headline: TextStyle(fontSize: 24.0, color: Colors.white),
    //   title: TextStyle(fontSize: 22.0, color: Colors.white),
    //   body2: TextStyle(fontSize: 18.0, color: Colors.white),
    //   body1: TextStyle(fontSize: 16.0, color: Colors.white),
    //   caption: TextStyle(fontSize: 14.0, color: Colors.white),
    //   button: TextStyle(fontSize: 14.0, color: Colors.white),
    // ),
  );
}
