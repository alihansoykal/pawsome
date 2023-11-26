import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gen/gen.dart';

extension SvgGenImageExtension on SvgGenImage {
  SvgPicture get asSvg => this.svg(package: 'gen');
}

extension AssetGenImageExtension on AssetGenImage {
  Image get asImage => image(package: 'gen');
}
