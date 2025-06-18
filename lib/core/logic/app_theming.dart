import 'package:flutter/material.dart';

// Enum لتعريف الثيمات
enum AppTheme { light, dark }

final appThemeData = {
  AppTheme.light: ThemeData(
    primaryColor: const Color(0xff28CF05),
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xff28CF05),
      brightness: Brightness.light,
    ).copyWith(
      surface: const Color(0xffffffff), // سطح محايد وفاتح بدون اصفرار
      background: const Color(0xFFF5F5F5),
    ),
    scaffoldBackgroundColor: const Color(0xFFF5F5F5),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFFF5F5F5),
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.black),
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.black, fontSize: 16),
      bodyMedium: TextStyle(color: Colors.black54, fontSize: 14),
    ),
    switchTheme: const SwitchThemeData(
      thumbColor: MaterialStatePropertyAll(Color(0xff28CF05)),
      trackColor: MaterialStatePropertyAll(Color(0xff28CF05)),
    ),
  ),
  AppTheme.dark: ThemeData.dark().copyWith(
    primaryColor: const Color(0xff28CF05),
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xff28CF05),
      brightness: Brightness.dark,
    ).copyWith(
      background: const Color(0xFF222222), // خلفية أغمق
      surface: const Color(0xFF2A2A2A), // سطح أغمق بس لسه في فرق عن الخلفية
    ),
    scaffoldBackgroundColor: const Color(0xFF222222),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF222222),
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.white),
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.white, fontSize: 16),
      bodyMedium: TextStyle(color: Colors.white70, fontSize: 14),
    ),
  ),
};
