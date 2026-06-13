import 'package:flutter/material.dart';

/// Design tokens matching the web platform
class AppColors {
  // Primary Colors
  static const Color background = Color(0xFFF4F6F9);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color dark = Color(0xFF0A1628);
  static const Color darkSoft = Color(0xFF152238);
  
  // Accent Colors
  static const Color accent = Color(0xFFFF6B00);
  static const Color accentHover = Color(0xFFE55F00);
  static const Color accentLight = Color(0xFFFFF4EB);
  
  // Text Colors
  static const Color textPrimary = Color(0xFF1A2332);
  static const Color textMuted = Color(0xFF64748B);
  
  // UI Colors
  static const Color border = Color(0xFFE2E8F0);
  static const Color success = Color(0xFF16A34A);
  static const Color danger = Color(0xFFDC2626);
  static const Color warning = Color(0xFFF59E0B);
  
  // Gradients
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [accent, accentHover],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  
  static const LinearGradient darkGradient = LinearGradient(
    colors: [dark, darkSoft],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
