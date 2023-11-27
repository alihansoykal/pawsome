import 'package:get_it/get_it.dart';

import '../../service/network/app_network_manager.dart';

final class AppContainer {
  const AppContainer._();
  static final _getIt = GetIt.I;

  /// App core required items
  static void setup() {
    _getIt.registerSingleton<AppNetworkManager>(AppNetworkManager.base());
  }

  static T read<T extends Object>() => _getIt<T>();
}
