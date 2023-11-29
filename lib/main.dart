import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pawsome/feature/home/view_model/state/home_state_event.dart';
import 'package:pawsome/product/init/initialization_manager.dart';
import 'package:pawsome/product/init/localization_manager.dart';
import 'package:pawsome/product/init/theme/custom_light_theme.dart';
import 'package:pawsome/product/service/api_service.dart';
import 'package:pawsome/product/state/bloc/breeds_bloc.dart';
import 'package:pawsome/product/state/container/app_state_items.dart';
import 'package:provider/provider.dart';

import 'product/init/navigation/app_router.dart';

Future<void> main() async {
  await InitializationManager().init();

  final documentDirectory = await getApplicationDocumentsDirectory();
  Hive.init(documentDirectory.path);
  await Hive.openBox('breedImages');

  runApp(LocalizationManager(child: const _PawsomeApp()));
}

class _PawsomeApp extends StatelessWidget {
  const _PawsomeApp();

  static final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<BreedsBloc>(
          create: (context) => BreedsBloc(
            apiService: ApiService(AppStateItems.appNetworkManager),
            hiveBox: Hive.box('breedImages'),
          ),
        ),
        BlocProvider<TextBloc>(
          create: (context) => TextBloc(),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: _appRouter.config(),
        theme: CustomLightTheme().themeData,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
      ),
    );
  }
}
