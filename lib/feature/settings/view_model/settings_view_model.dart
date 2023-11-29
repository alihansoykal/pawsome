import 'package:gen/gen.dart';
import 'package:pawsome/feature/settings/model/settings_item.dart';
import 'package:pawsome/product/init/language/locale_keys.g.dart';
import 'package:pawsome/product/utility/extension/asset_extensions.dart';
import 'package:pawsome/product/utility/extension/string_localization.dart';

class SettingsViewModel {
  List<SettingsItem> getItems() {
    var leadingIcons = [
      Assets.icons.icHelp.asSvg,
      Assets.icons.icRate.asSvg,
      Assets.icons.icShare.asSvg,
      Assets.icons.icTerms.asSvg,
      Assets.icons.icPolicy.asSvg,
      Assets.icons.icVersion.asSvg,
    ];
    var titles = [
      LocaleKeys.settings_help,
      LocaleKeys.settings_rateUs,
      LocaleKeys.settings_share,
      LocaleKeys.settings_terms,
      LocaleKeys.settings_privacy,
      LocaleKeys.settings_version,
    ];

    var baseItems = List.generate(titles.length, (index) {
      return SettingsItem(
        title: titles[index].locale,
        leadingIcon: leadingIcons[index],
        trailingIcon: Assets.icons.icArrow.asSvg,
      );
    });

    return [
      ...baseItems,
    ];
  }
}
