import 'package:pawsome/product/init/theme/custom_light_theme.dart';
import 'package:pawsome/product/service/network/app_network_manager.dart';
import 'package:pawsome/product/state/container/app_state_container.dart';

final class AppStateItems {
  const AppStateItems._();

  static AppNetworkManager get appNetworkManager => AppContainer.read<AppNetworkManager>();
  static CustomLightTheme get customLightTheme => AppContainer.read<CustomLightTheme>();
}
