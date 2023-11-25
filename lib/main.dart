import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pawsome/product/init/localization_manager.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(LocalizationManager(child: const PawsomeApp()));
}

class PawsomeApp extends StatelessWidget {
  const PawsomeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
    );
  }
}
