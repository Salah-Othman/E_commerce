import 'package:flutter/material.dart';

ThemeData theme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.light(),
  scaffoldBackgroundColor: Color.fromRGBO(255, 255, 255, 1),
  // textButtonTheme: TextButtonThemeData(
  //   style: TextButton.styleFrom(
  //     foregroundColor: Color.fromRGBO(255, 255, 255, 1),
  //     textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
  //   ),
  // ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Color.fromRGBO(24, 24, 24, 1),
      foregroundColor: Color.fromRGBO(255, 255, 255, 1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(5),
      ),
      textStyle: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w700,
        color: Color.fromRGBO(255, 255, 255, 1),
      ),
    ),
  ),
  // inputDecorationTheme: InputDecorationThemeData(
  //   border: OutlineInputBorder(
  //     borderSide: BorderSide.none,
  //     borderRadius: BorderRadius.zero,
  //   ),
  //   fillColor: Color.fromRGBO(255, 255, 255, 1),
  //   filled: true,
  //   hintStyle: TextStyle(
  //     fontSize: 16,
  //     fontWeight: FontWeight.w400,
  //     color: Color.fromRGBO(54, 54, 54, 1),
  //   )   
  // ),
);
