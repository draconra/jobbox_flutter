import 'package:flutter/material.dart';

import '../../../util/theme/icons.dart';
import '../image/icon_image.dart';

class IconBoxButton extends StatelessWidget {
  // -- Props --
  final AppIcons icon;
  final VoidCallback onTap;

  const IconBoxButton({
    super.key,
    required this.icon,
    required this.onTap,
  });

  // -- UI --
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Theme.of(context).colorScheme.secondary.withOpacity(0.1),
      borderRadius: BorderRadius.circular(10),
      onTap: onTap,
      child: Container(
        height: 52,
        width: 52,
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Theme.of(context).colorScheme.secondary.withOpacity(0.2)),
        child: MyIcon(
          icon: icon,
          color: Theme.of(context).colorScheme.secondary,
        ),
      ),
    );
  }
}
