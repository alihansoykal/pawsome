import 'package:flutter/material.dart';
import 'package:pawsome/product/init/theme/custom_color_scheme.dart';
import 'package:pawsome/product/init/theme/custom_theme.dart';

final class CustomLightTheme implements CustomTheme {
  @override
  ThemeData get themeData => ThemeData(
        useMaterial3: true,
        fontFamily: 'Galano-Grotesque',
        colorScheme: CustomColorScheme.lightColorScheme,
        textTheme: textThemeData,
      );

  @override
  final ButtonStyle buttonStyle = ElevatedButton.styleFrom(
    backgroundColor: CustomColorScheme.lightColorScheme.outline,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(12)),
    ),
  );

  @override
  TextTheme get textThemeData => TextTheme(
        headlineLarge: TextStyle(
          color: CustomColorScheme.lightColorScheme.primary,
          fontSize: 11,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.22,
        ),
        headlineMedium: TextStyle(
          color: CustomColorScheme.lightColorScheme.onSurface,
          fontSize: 20,
          fontWeight: FontWeight.w600,
          height: 0.07,
          letterSpacing: 0.20,
        ),
        headlineSmall: TextStyle(
          color: CustomColorScheme.lightColorScheme.onSurface,
          fontSize: 11,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.22,
        ),
        titleMedium: TextStyle(
          color: CustomColorScheme.lightColorScheme.primary,
          fontSize: 20,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.20,
        ),
        titleSmall: TextStyle(
          color: CustomColorScheme.lightColorScheme.onSurface,
          fontSize: 16,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.16,
        ),
        labelMedium: TextStyle(
          color: CustomColorScheme.lightColorScheme.onPrimary,
          fontSize: 18,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.09,
        ),
        bodyMedium: TextStyle(
          color: CustomColorScheme.lightColorScheme.onSurface,
          fontSize: 16,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.16,
        ),
        bodySmall: TextStyle(
          color: CustomColorScheme.lightColorScheme.secondary,
          fontSize: 16,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.16,
        ),
        displayMedium: TextStyle(
          color: CustomColorScheme.lightColorScheme.onSurface,
          fontSize: 18,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.09,
        ),
        displaySmall: TextStyle(
          color: CustomColorScheme.lightColorScheme.secondary,
          fontSize: 16,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.16,
        ),
        labelSmall: TextStyle(
          color: CustomColorScheme.lightColorScheme.secondary,
          fontSize: 13,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.13,
        ),
      );
}
