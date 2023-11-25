import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pawsome/product/init/initialization_manager.dart';
import 'package:pawsome/product/init/localization_manager.dart';

Future<void> main() async {
  await InitializationManager().init();
  runApp(LocalizationManager(child: const _PawsomeApp()));
}

class _PawsomeApp extends StatelessWidget {
  const _PawsomeApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
    );
  }
}
