import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/app_colors.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColors.background,
      
      // Color Scheme
      colorScheme: const ColorScheme.light(
        primary: AppColors.accent,
        secondary: AppColors.dark,
        surface: AppColors.surface,
        error: AppColors.danger,
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onSurface: AppColors.textPrimary,
      ),
      
      // Typography matching Inter & DM Sans
      textTheme: GoogleFonts.interTextTheme().copyWith(
        displayLarge: GoogleFonts.dmSans(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: AppColors.textPrimary,
          height: 1.2,
        ),
        displayMedium: GoogleFonts.dmSans(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: AppColors.textPrimary,
          height: 1.2,
        ),
        displaySmall: GoogleFonts.dmSans(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: AppColors.textPrimary,
          height: 1.3,
        ),
        headlineMedium: GoogleFonts.dmSans(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: AppColors.textPrimary,
        ),
        titleLarge: GoogleFonts.inter(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: AppColors.textPrimary,
        ),
        titleMedium: GoogleFonts.inter(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: AppColors.textPrimary,
        ),
        bodyLarge: GoogleFonts.inter(
          fontSize: 16,
          color: AppColors.textPrimary,
          height: 1.6,
        ),
        bodyMedium: GoogleFonts.inter(
          fontSize: 14,
          color: AppColors.textPrimary,
          height: 1.6,
        ),
        bodySmall: GoogleFonts.inter(
          fontSize: 12,
          color: AppColors.textMuted,
          height: 1.5,
        ),
      ),
      
      // AppBar Theme
      appBarTheme: AppBarTheme(
        elevation: 0,
        backgroundColor: AppColors.surface,
        surfaceTintColor: Colors.transparent,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        iconTheme: const IconThemeData(color: AppColors.textPrimary),
        titleTextStyle: GoogleFonts.dmSans(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: AppColors.textPrimary,
        ),
      ),
      
      // Card Theme
      cardTheme: CardThemeData(
        elevation: 0,
        color: AppColors.surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        shadowColor: AppColors.dark.withOpacity(0.08),
      ),
      
      // Input Decoration Theme
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.surface,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.border),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.border),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.accent, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.danger),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      ),
      
      // Elevated Button Theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.accent,
          foregroundColor: Colors.white,
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          textStyle: GoogleFonts.inter(
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      
      // Outlined Button Theme
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.dark,
          side: const BorderSide(color: AppColors.border, width: 2),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          textStyle: GoogleFonts.inter(
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      
      // Bottom Navigation Bar Theme
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.surface,
        selectedItemColor: AppColors.accent,
        unselectedItemColor: AppColors.textMuted,
        type: BottomNavigationBarType.fixed,
        elevation: 8,
      ),
      
      // Divider Theme
      dividerTheme: const DividerThemeData(
        color: AppColors.border,
        thickness: 1,
        space: 1,
      ),
    );
  }
  
  // Shadows matching web design
  static List<BoxShadow> get shadowSm => [
    BoxShadow(
      color: AppColors.dark.withOpacity(0.06),
      blurRadius: 3,
      offset: const Offset(0, 1),
    ),
  ];
  
  static List<BoxShadow> get shadowMd => [
    BoxShadow(
      color: AppColors.dark.withOpacity(0.08),
      blurRadius: 30,
      offset: const Offset(0, 8),
    ),
  ];
  
  static List<BoxShadow> get shadowLg => [
    BoxShadow(
      color: AppColors.dark.withOpacity(0.12),
      blurRadius: 60,
      offset: const Offset(0, 20),
    ),
  ];
}
