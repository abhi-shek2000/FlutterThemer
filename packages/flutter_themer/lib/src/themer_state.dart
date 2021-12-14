import 'package:encrypted_shared_preferences/encrypted_shared_preferences.dart';
import 'package:flutter/material.dart';

class ThemerState {
  static const String SAVED_THEME = "savedTheme";
  static const String THEME_SYSTEM = "system";
  static const String THEME_DARK = "dark";
  static const String THEME_LIGHT = "light";

  static final EncryptedSharedPreferences encryptedSharedPreferences =
      EncryptedSharedPreferences();

  static Future<ThemeMode> get getsavedTheme async {
    String savedTheme = await encryptedSharedPreferences.getString(SAVED_THEME);

    if (savedTheme == THEME_DARK) {
      return ThemeMode.dark;
    } else if (savedTheme == THEME_LIGHT) {
      return ThemeMode.light;
    } else {
      return ThemeMode.system;
    }
  }

  static Future<void> saveThemeMode(ThemeMode save) async {
    if (save == ThemeMode.dark) {
      await encryptedSharedPreferences.setString(SAVED_THEME, THEME_DARK);
      return;
    } else if (save == ThemeMode.light) {
      await encryptedSharedPreferences.setString(SAVED_THEME, THEME_LIGHT);
      return;
    } else {
      await encryptedSharedPreferences.setString(SAVED_THEME, THEME_SYSTEM);
      return;
    }
  }
}
