import 'package:catbreedsapp/core/presentation/styles/app_palette.dart';
import 'package:flutter/material.dart';

/// Defines the main theme configuration for the application.
///
/// This theme applies a global font family and disables Material 3.
final mainTheme = ThemeData(
  useMaterial3: false,
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: Colors.black,
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(
        color: AppPalette.accentColor,
      ),
    ),
  ),
);
