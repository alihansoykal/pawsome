import 'dart:io';

import 'package:flutter/widgets.dart';

final class AppNetworkErrorManager {
  AppNetworkErrorManager(this.context);
  final BuildContext context;

  void handleError(int statusCode) {
    if (statusCode == HttpStatus.unauthorized) {
    } else if (statusCode == HttpStatus.notFound) {}
  }
}
