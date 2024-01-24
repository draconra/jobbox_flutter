import 'package:flutter/material.dart';

import '../../../widgets/item/file_item.dart';
import '../../../model/file_document.dart';

class FileItemButton extends StatelessWidget {
  // -- Props --
  final FileDocument fileDocument;

  const FileItemButton({super.key, required this.fileDocument});

  // -- UI --
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            width: fileDocument.isSelected ? 0 : 1,
            color: fileDocument.isSelected
                ? Colors.transparent
                : Theme.of(context).colorScheme.secondary.withOpacity(0.15),
          ),
          color: Theme.of(context).colorScheme.secondary.withOpacity(
                fileDocument.isSelected ? 1 : 0.12,
              ),
        ),
        child: InkWell(
          splashColor: Colors.transparent,
          highlightColor: Theme.of(context).primaryColor.withOpacity(0.05),
          borderRadius: BorderRadius.circular(10),
          onTap: () => {},
          child: Ink(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 28),
            child: FileItem(
              fileDocument: fileDocument,
              isEditing: false,
              color: fileDocument.isSelected
                  ? Theme.of(context).colorScheme.onSecondary
                  : Theme.of(context).colorScheme.secondary,
            ),
          ),
        ),
      ),
    );
  }
}
