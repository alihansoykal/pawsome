import 'package:flutter/material.dart';
import 'package:gen/gen.dart';

class CustomColorScheme {
  CustomColorScheme._();

  static const lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: ColorName.primary,
    onPrimary: ColorName.onPrimary,
    primaryContainer: ColorName.primaryContainer,
    onPrimaryContainer: ColorName.onPrimaryContainer,
    secondary: ColorName.secondary,
    onSecondary: ColorName.onSecondary,
    background: ColorName.background,
    onBackground: ColorName.onBackground,
    surface: ColorName.surface,
    onSurface: ColorName.onSurface,
    error: ColorName.error,
    onError: ColorName.onError,
    outline: ColorName.outline,
  );
}
