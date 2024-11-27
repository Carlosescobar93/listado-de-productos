import 'package:flutter/material.dart';

class themesApp { 
   static const Color primary = Colors.lightGreen;
  
  static final ThemeData lighTheme = ThemeData.light().copyWith(
    primaryColor: primary,


    appBarTheme: const AppBarTheme(
      color: primary,
      elevation: 5,
    ),

    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: primary,
      ),
    ),

    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: primary,
      elevation: 5,
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: const StadiumBorder(),
        backgroundColor: primary,
        foregroundColor: Colors.white,
        elevation: 5,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 2,
      ),
      floatingLabelStyle: const TextStyle(color: primary),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: primary),
        borderRadius: BorderRadius.circular(10),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: primary, width: 2),
        borderRadius: BorderRadius.circular(10),
      ),

      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),

    cardTheme: const CardTheme(
      color: Color.fromARGB(255, 240, 237, 237),
      elevation: 5,
    ),
  );
}