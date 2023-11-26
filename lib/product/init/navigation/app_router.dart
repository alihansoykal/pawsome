import 'package:auto_route/auto_route.dart';
import 'package:pawsome/feature/dashboard/view/dashboard_view.dart';
import 'package:pawsome/feature/settings/view/settings_view.dart';

import '../../../feature/home/view/home_view.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: AppRouter._replaceRouteName)
final class AppRouter extends _$AppRouter {
  static const _replaceRouteName = 'View,Route';
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: DashboardRoute.page,
          initial: true,
          children: [
            AutoRoute(
              page: HomeRoute.page,
              initial: true,
            ),
            AutoRoute(page: SettingsRoute.page),
          ],
        ),
      ];
}
