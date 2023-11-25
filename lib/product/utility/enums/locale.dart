import 'package:flutter/material.dart';

/// The code is defining an enum called `Locals` with a single value `en`. Each value in the enum is
/// associated with a `Locale` object. The `Locale` object represents a specific geographical,
/// political, or cultural region.
enum Locales {
  en(Locale('en-US', 'US'));

  final Locale locale;

  const Locales(this.locale);
}
