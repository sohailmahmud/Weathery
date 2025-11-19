import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppTheme {
  // Text Styles using Google Fonts
  static TextStyle get heading1 => GoogleFonts.poppins(
    fontSize: 32,
    fontWeight: FontWeight.w400,
    letterSpacing: -0.5,
    color: AppColors.white,
  );

  static TextStyle get heading2 => GoogleFonts.poppins(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: AppColors.white,
  );

  static TextStyle get subtitle1 => GoogleFonts.inter(
    fontSize: 18,
    fontWeight: FontWeight.w400,
    letterSpacing: -0.2,
    color: AppColors.white,
  );

  static TextStyle get body1 => GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.white,
  );

  static TextStyle get body2 => GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.white,
  );

  static TextStyle get label => GoogleFonts.inter(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.white,
  );

  // Gradient Configurations
  static const LinearGradient blueGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      AppColors.primaryLight,
      AppColors.primaryMedium,
      AppColors.secondaryLight,
    ],
  );

  static const LinearGradient errorGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      AppColors.errorLight,
      AppColors.errorMedium,
      AppColors.errorLight2,
    ],
  );

  // Border Radius
  static const double borderRadiusSmall = 12.0;
  static const double borderRadiusMedium = 14.0;
  static const double borderRadiusLarge = 24.0;

  // Padding
  static const EdgeInsets paddingSmall = EdgeInsets.symmetric(horizontal: 16);
  static const EdgeInsets paddingMedium = EdgeInsets.symmetric(horizontal: 32);
  static const EdgeInsets paddingLarge = EdgeInsets.all(20);

  // Icon Sizes
  static const double iconSmall = 20.0;
  static const double iconMedium = 24.0;
  static const double iconLarge = 150.0;

  // Typography Sizes
  static const double fontSizeSmall = 12.0;
  static const double fontSizeMedium = 16.0;
  static const double fontSizeLarge = 24.0;
  static const double fontSizeXLarge = 104.0;

  // Opacity Values
  static const double opacityHigh = 1.0;
  static const double opacityMediumHigh = 0.95;
  static const double opacityMedium = 0.8;
  static const double opacityMediumLow = 0.7;
  static const double opacityLow = 0.6;
  static const double opacityVeryLow = 0.4;

  // Material Color Scheme
  static ThemeData lightTheme() {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primaryLight,
        brightness: Brightness.light,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.transparent,
        elevation: 0,
      ),
      scaffoldBackgroundColor: AppColors.white,
    );
  }

  static ThemeData darkTheme() {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primaryLight,
        brightness: Brightness.dark,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.transparent,
        elevation: 0,
      ),
      scaffoldBackgroundColor: AppColors.black,
    );
  }
}
