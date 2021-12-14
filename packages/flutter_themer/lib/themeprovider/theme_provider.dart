// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables, constant_identifier_names

import 'package:encrypted_shared_preferences/encrypted_shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_themer/src/themer_state.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode;
  ThemeProvider({required this.themeMode});

  bool get isDarkMode {
    if (themeMode == ThemeMode.system) {
      final brightness = SchedulerBinding.instance!.window.platformBrightness;
      return brightness == Brightness.dark;
    } else {
      return themeMode == ThemeMode.dark;
    }
  }

  Future<void> toggleTheme(bool isOn) async {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    await ThemerState.saveThemeMode(themeMode);
    notifyListeners();
  }
}

class MyThemes {
  final lightTheme;
  final darkTheme;

  MyThemes({
    this.lightTheme,
    this.darkTheme,
  });

  //  = ThemeData(
  //   scaffoldBackgroundColor: Colors.grey.shade900,
  //   primaryColor: Colors.black,
  //   colorScheme: ColorScheme.dark(),
  //   iconTheme: IconThemeData(color: Colors.purple.shade200, opacity: 0.8),
  // );

  //  = ThemeData(
  //   scaffoldBackgroundColor: Colors.white,
  //   primaryColor: Colors.white,
  //   colorScheme: ColorScheme.light(),
  //   iconTheme: IconThemeData(color: Colors.purple, opacity: 0.8),
  //   elevatedButtonTheme: ElevatedButtonThemeData(
  //       style: ButtonStyle(
  //           padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
  //               EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0)),
  //           shape: MaterialStateProperty.all<OutlinedBorder>(
  //               RoundedRectangleBorder(
  //                   borderRadius: BorderRadius.circular(20.0))),
  //           backgroundColor: MaterialStateProperty.all<Color>(Colors.orange))),
  // );
}
