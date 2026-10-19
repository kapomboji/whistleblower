import 'package:flutter/material.dart';

abstract final class AppColors {
  static const background = Color(0xFF49B3F3);
  static const darkBlue = Color(0xFF24396F);
  static const neutralTransparent = Color(0x00737373);
  static const white = Color(0xFFFFFFFF);
}

abstract final class AppTheme {
  static ThemeData get light {
    return ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColors.background,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.background,
        brightness: Brightness.light,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.white,
        foregroundColor: AppColors.darkBlue,
      ),
      fontFamily: 'CreatoDisplay',
      useMaterial3: true,
    );
  }
}