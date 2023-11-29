import 'dart:io';

mixin PlatformInfoMixin {
  String getOperatingSystemVersion() {
    String fullVersion = Platform.operatingSystemVersion;

    String version = fullVersion.split(' ')[1];
    return version;
  }
}
