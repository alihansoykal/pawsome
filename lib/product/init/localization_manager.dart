import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pawsome/product/utility/enums/locale.dart';

@immutable
final class LocalizationManager extends EasyLocalization {
  LocalizationManager({
    required super.child,
    super.key,
  }) : super(
          supportedLocales: _supportedLocales,
          path: _translationPath,
          useOnlyLangCode: true,
        );

  static final List<Locale> _supportedLocales = [
    Locales.en.locale,
  ];

  static const String _translationPath = 'asset/translation';
}
