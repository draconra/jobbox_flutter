import 'package:flutter/material.dart';

class MySwitch extends StatelessWidget {
  // -- Props --
  final bool isOn;
  final Function(bool) onChanged;

  const MySwitch({super.key, required this.isOn, required this.onChanged});

  // -- UI --
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragEnd: (v) {
        onChanged(!isOn);
      },
      child: Container(
        alignment: isOn
            ? AlignmentDirectional.centerStart
            : AlignmentDirectional.centerEnd,
        width: 54,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(25),
          border: Border.all(
            width: 1.1,
            color: Theme.of(context).colorScheme.onBackground.withOpacity(
                  isOn ? 1 : 0.2,
                ),
          ),
        ),
        child: Container(
          width: 24,
          height: 24,
          margin: const EdgeInsets.all(2),
          decoration: BoxDecoration(
            color: Theme.of(context)
                .colorScheme
                .onBackground
                .withOpacity(isOn ? 1 : 0.4),
            borderRadius: BorderRadius.circular(25),
          ),
        ),
      ),
    );
  }
}
