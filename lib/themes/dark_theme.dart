import "package:flutter/material.dart";

final ThemeData darkTheme = ThemeData(
  colorScheme: ColorScheme.dark(
    surface: Colors.blue.shade200,
    primary: Colors.blue.shade300,
    secondary: Colors.blue.shade500,
    tertiary: Colors.blue.shade800,
    inversePrimary: Colors.grey, // Replace with your primary color
    brightness: Brightness.dark,
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
