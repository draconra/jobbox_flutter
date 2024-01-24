import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../util/theme/colors.dart';
import '../../../../util/theme/icons.dart';
import '../image/icon_image.dart';
import '../../../model/file_document.dart';

class FileItem extends StatelessWidget {
  // -- Props --
  final String? title;
  final FileDocument fileDocument;
  final bool isEditing;
  final Color? color;

  const FileItem({
    super.key,
    this.title,
    required this.fileDocument,
    required this.isEditing,
    this.color,
  });

  // -- UI --
  @override
  Widget build(BuildContext context) {
    final accentColor = color ?? AppColors.brownDark.color;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title!,
                textAlign: TextAlign.start,
                style: Theme.of(context).textTheme.labelMedium,
              ),
              const SizedBox(height: 6),
            ],
          ),
        Row(
          children: [
            MyIcon(
              icon: AppIcons.file,
              length: 34,
              color: accentColor,
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  fileDocument.fileName,
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        color: accentColor,
                      ),
                ),
                const SizedBox(height: 2),
                Text(
                  DateFormat('dd/MM/yy').format(fileDocument.uploadDate),
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        fontSize: 13,
                        color: accentColor,
                      ),
                ),
              ],
            )
          ],
        ),
      ],
    );
  }
}
