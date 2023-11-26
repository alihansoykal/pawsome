import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pawsome/product/init/initialization_manager.dart';
import 'package:pawsome/product/init/localization_manager.dart';
import 'package:pawsome/product/init/theme/custom_light_theme.dart';

import 'product/init/navigation/app_router.dart';

Future<void> main() async {
  await InitializationManager().init();
  runApp(LocalizationManager(child: const _PawsomeApp()));
}

class _PawsomeApp extends StatelessWidget {
  const _PawsomeApp();

  static final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _appRouter.config(),
      theme: CustomLightTheme().themeData,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
    );
  }
}
