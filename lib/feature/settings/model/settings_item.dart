import 'package:flutter/material.dart';

class SettingsItem {
  final String title;
  final Widget leadingIcon;
  final Widget? trailingIcon;

  SettingsItem({
    required this.title,
    required this.leadingIcon,
    this.trailingIcon,
  });
}
