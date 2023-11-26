import 'package:envied/envied.dart';
import 'package:gen/src/env/app_configuration.dart';

part 'dev_env.g.dart';

/// Dev environment configuration.
@Envied(path: 'assets/env/.dev.env', obfuscate: true)
final class DevEnv implements AppConfiguration {
  @EnviedField(varName: 'BASE_URL')
  static final String _baseUrl = _DevEnv._baseUrl;

  @override
  String get baseUrl => _baseUrl;
}
