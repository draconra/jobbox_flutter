import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../util/theme/icons.dart';

class MyLogo extends StatelessWidget {
  // -- Props --
  final AppLogos logo;
  final double length;
  final Color? color;

  const MyLogo({
    super.key,
    required this.logo,
    this.length = 74,
    this.color,
  });

  // -- UI --
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      logo.path,
      width: length,
      height: length,
      color: color,
    );
  }
}
