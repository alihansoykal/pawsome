import 'package:gen/gen.dart';

final class EnviromentManager {
  EnviromentManager.setup(AppConfiguration appConfiguration) {
    _appConfiguration = appConfiguration;
  }

  static late final AppConfiguration _appConfiguration;
}

enum EnviromentItem {
  baseUrl;

  String get value {
    try {
      switch (this) {
        case EnviromentItem.baseUrl:
          return EnviromentManager._appConfiguration.baseUrl;
      }
    } catch (e) {
      throw Exception('EnviromentItem $this is not initilized');
    }
  }
}
