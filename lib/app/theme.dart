import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get darkTheme {
    return ThemeData(
      fontFamily: 'Plus Jakarta Sans',
      scaffoldBackgroundColor: const Color(0xFF121212),
      colorScheme: const ColorScheme.dark(
        primary: Color(0xFF2E5B32), // Deep organic green
        secondary: Color(0xFFD4A373), // Earthy warm amber
        surface: Color(0xFF121212), // Deep charcoal/moss background
        onSurface: Colors.white,
      ),
      useMaterial3: true,
    );
  }
}
