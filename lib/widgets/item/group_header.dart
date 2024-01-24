import 'package:flutter/material.dart';

import '../../../util/theme/icons.dart';
import '../image/icon_image.dart';

class GroupHeader extends StatelessWidget {
  // -- Props --
  final String title;
  final double editIconLength;

  final VoidCallback onTapEdit;
  const GroupHeader({
    super.key,
    required this.title,
    this.editIconLength = 38,
    required this.onTapEdit,
  });

  // -- UI --
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      alignment: Alignment.topLeft,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: Theme.of(context).textTheme.titleMedium),
          Material(
            child: InkWell(
              borderRadius: BorderRadius.circular(10),
              splashColor: Colors.transparent,
              highlightColor:
                  Theme.of(context).colorScheme.primary.withOpacity(0.1),
              onTap: onTapEdit,
              child: Ink(
                padding: const EdgeInsets.all(8),
                width: editIconLength,
                height: editIconLength,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.transparent,
                ),
                child: MyIcon(
                  icon: AppIcons.pen,
                  length: editIconLength,
                  color: Theme.of(context).colorScheme.onBackground,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
