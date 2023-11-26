import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gen/gen.dart';
import 'package:pawsome/product/init/language/locale_keys.g.dart';
import 'package:pawsome/product/utility/extension/asset_extensions.dart';
import 'package:pawsome/product/utility/extension/string_localization.dart';

import '../../../product/init/navigation/app_router.dart';

@RoutePage()
class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const [
        HomeRoute(),
        SettingsRoute(),
      ],
      bottomNavigationBuilder: (_, tabsRouter) => BottomNavigationBar(
        currentIndex: tabsRouter.activeIndex,
        onTap: tabsRouter.setActiveIndex,
        items: [
          BottomNavigationBarItem(
            icon: Assets.icons.icHome.asSvg,
            label: LocaleKeys.navigation_home.locale,
          ),
          BottomNavigationBarItem(
            icon: Assets.icons.icSettings.asSvg,
            label: LocaleKeys.navigation_settings.locale,
          ),
        ],
      ),
    );
  }
}
