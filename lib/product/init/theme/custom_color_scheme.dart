import 'package:flutter/material.dart';

final class CustomColorScheme {
  CustomColorScheme._();

  static const lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xFF0055D3),
    outline: Color(0xFF0085FF),
    onPrimary: Color(0xFFFFFFFF),
    primaryContainer: Color(0xFFD1D1D6),
    onPrimaryContainer: Color(0xFF000000),
    secondary: Color(0x993C3C43),
    onSecondary: Color(0xFFFFFFFF),
    background: Color(0xFFFFFFFF),
    onBackground: Color(0xFF000000),
    surface: Color(0xFFD1D1D6),
    onSurface: Color(0xFF000000),
    error: Color(0xFF000000),
    onError: Color(0xFFFFFFFF),
  );
}
