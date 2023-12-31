import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:easy_logger/easy_logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gen/gen.dart';
import 'package:logger/logger.dart';
import 'package:pawsome/product/init/config/enviroment_manager.dart';
import 'package:pawsome/product/state/container/app_state_container.dart';

@immutable
final class InitializationManager {
  Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await runZonedGuarded<Future<void>>(
      _initialize,
      (error, stack) {
        Logger().e(error);
      },
    );
  }

  Future<void> _initialize() async {
    await EasyLocalization.ensureInitialized();
    EasyLocalization.logger.enableLevels = [LevelMessages.error];
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    FlutterError.onError = (FlutterErrorDetails details) {
      Logger().e(details.exceptionAsString());
    };
    EnviromentManager.setup(DevEnv());
    AppContainer.setup();
  }
}
