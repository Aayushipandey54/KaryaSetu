import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static const Color black = Color(0xFF000000);
  static const Color yellow = Color(0xFFFFC107);
  static const Color darkGrey = Color(0xFF121212);
  static const Color lightGrey = Color(0xFF2C2C2C);
  static const Color error = Color(0xFFD32F2F);
}

class AppTheme {
  static ThemeData get industrialTheme {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: AppColors.black,
      scaffoldBackgroundColor: AppColors.darkGrey,
      colorScheme: ColorScheme.dark(
        primary: AppColors.yellow,
        secondary: AppColors.yellow,
        surface: AppColors.lightGrey,
        error: AppColors.error,
      ),
      textTheme: GoogleFonts.outfitTextTheme(
        ThemeData.dark().textTheme,
      ).copyWith(
        displayLarge: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 32,
        ),
        headlineMedium: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.yellow,
          foregroundColor: AppColors.black,
          shape: const BeveledRectangleBorder(), // Sharp edges for industrial look
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          textStyle: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.black,
        elevation: 0,
        centerTitle: true,
      ),
    );
  }
}
