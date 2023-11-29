import 'package:flutter/material.dart';
import 'package:gen/gen.dart';
import 'package:pawsome/feature/settings/model/settings_item.dart';
import 'package:pawsome/product/state/container/app_state_items.dart';

class SettingsItemWidget extends StatelessWidget {
  final SettingsItem item;
  final bool isLastItem;
  final String osVersion;

  const SettingsItemWidget({
    super.key,
    required this.item,
    required this.isLastItem,
    required this.osVersion,
  });

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = AppStateItems.customLightTheme.textThemeData;
    return Column(
      children: [
        ListTile(
          title: Text(
            item.title,
            style: textTheme.bodyMedium,
          ),
          leading: item.leadingIcon,
          trailing: isLastItem
              ? Text(
                  osVersion,
                  style: textTheme.labelSmall,
                )
              : item.trailingIcon,
        ),
        if (!isLastItem)
          Divider(
            indent: 16,
            thickness: 2,
            color: AppColors.surface.withOpacity(0.6),
          ),
      ],
    );
  }
}
