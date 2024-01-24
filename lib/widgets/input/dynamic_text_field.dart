import 'package:flutter/material.dart';

import './text_field.dart';

class DynamicTextField extends StatelessWidget {
  // -- Props --
  final bool isEditing;
  final MyTextFieldProps props;

  const DynamicTextField(
      {super.key, required this.isEditing, required this.props});

  // -- UI --
  @override
  Widget build(BuildContext context) {
    if (!isEditing) {
      return Container(
        alignment: AlignmentDirectional.topStart,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              props.title!,
              textAlign: TextAlign.start,
              style: Theme.of(context).textTheme.labelMedium,
            ),
            const SizedBox(height: 2),
            Text(
              props.controller.text,
              textAlign: TextAlign.start,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(fontSize: 16),
            ),
          ],
        ),
      );
    } else {
      return MyTextField(props: props);
    }
  }
}
