import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:pawsome/feature/settings/view/mixin/platform_io_mixin.dart';
import 'package:pawsome/feature/settings/view/widget/settings_item_widget.dart';
import 'package:pawsome/feature/settings/view_model/settings_view_model.dart';

@RoutePage()
class SettingsView extends StatelessWidget with PlatformInfoMixin {
  final viewModel = SettingsViewModel();

  SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    var items = viewModel.getItems();

    return Scaffold(
      body: Center(
        child: Column(
          children: items.asMap().entries.map((entry) {
            int idx = entry.key;
            var item = entry.value;
            return SettingsItemWidget(
              item: item,
              isLastItem: idx == items.length - 1,
              osVersion: getOperatingSystemVersion(),
            );
          }).toList(),
        ),
      ),
    );
  }
}
