// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  primaryColor: Colors.white,
  colorScheme: ColorScheme.light(),
  iconTheme: IconThemeData(color: Colors.purple, opacity: 0.8),
  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
              EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0)),
          shape: MaterialStateProperty.all<OutlinedBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0))),
          backgroundColor: MaterialStateProperty.all<Color>(Colors.orange))),
);

ThemeData darkTheme = ThemeData(
  scaffoldBackgroundColor: Colors.grey.shade900,
  primaryColor: Colors.black,
  colorScheme: ColorScheme.dark(),
  iconTheme: IconThemeData(color: Colors.purple.shade200, opacity: 0.8),
);
