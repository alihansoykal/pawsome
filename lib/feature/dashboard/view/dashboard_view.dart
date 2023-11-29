import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gen/gen.dart';
import 'package:pawsome/product/init/language/locale_keys.g.dart';
import 'package:pawsome/product/init/navigation/app_router.dart';
import 'package:pawsome/product/utility/extension/asset_extensions.dart';
import 'package:pawsome/product/utility/extension/string_localization.dart';
import 'package:widgets/widgets.dart';

@RoutePage()
class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigation(
        selectedIndex: selectedIndex,
        items: [
          BottomNavigationItem(icon: Assets.icons.icHome.asSvg, title: "Home"),
          BottomNavigationItem(icon: Assets.icons.icSettings.asSvg, title: "Settings"),
        ],
        onChange: (index) {
          setState(() {
            selectedIndex = index;
          });
          _navigateToSelectedPage(index, context);
        },
      ),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.background,
        elevation: 0,
        title: Text(LocaleKeys.appName.locale),
      ),
      body: const Stack(alignment: AlignmentDirectional.bottomEnd, children: [AutoRouter()]),
    );
  }

  void _navigateToSelectedPage(int index, BuildContext context) {
    switch (index) {
      case 0:
        context.router.navigate(const HomeRoute());
        break;
      case 1:
        context.router.navigate(SettingsRoute());
        break;
      default:
        break;
    }
  }
}
