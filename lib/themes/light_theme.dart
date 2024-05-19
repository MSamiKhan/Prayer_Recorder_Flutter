import "package:flutter/material.dart";

final ThemeData lightTheme = ThemeData(
  colorScheme: ColorScheme.light(
    surface: const Color.fromARGB(255, 6, 114, 131),
    primary: const Color.fromARGB(255, 65, 158, 172),
    secondary: Colors.white,
    tertiary: Colors.blue.shade800,
    inversePrimary: Colors.black, // Replace with your primary color
    brightness: Brightness.light,
  ),
  textTheme: const TextTheme(
    headlineLarge: TextStyle(
      fontSize: 24.0,
      fontWeight: FontWeight.bold,
    ),
    headlineMedium: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.bold,
    ),
    headlineSmall: TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.bold,
    ),
  ),
  fontFamily: 'Roboto', // Replace with your desired font family
);
