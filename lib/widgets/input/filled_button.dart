import 'package:flutter/material.dart';

class MyFilledButton extends StatelessWidget {
  // -- Props --
  final String title;
  final VoidCallback onTap;
  final bool enabled;

  MyFilledButton({
    super.key,
    required this.title,
    required this.onTap,
    this.enabled = true,
  });

  final _borderRadius = BorderRadius.circular(8);

  // -- UI --
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: enabled
          ? Theme.of(context).colorScheme.primary.withOpacity(0.1)
          : Colors.transparent,
      borderRadius: _borderRadius,
      onTap: () => {
        if (enabled) {onTap()}
      },
      child: Ink(
        width: double.infinity,
        height: 52,
        decoration: BoxDecoration(
          borderRadius: _borderRadius,
          color: Theme.of(context)
              .colorScheme
              .secondary
              .withOpacity(enabled ? 1 : 0.8),
        ),
        child: Center(
          child: Text(
            title,
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: Colors.white.withOpacity(enabled ? 1 : 0.8),
                ),
          ),
        ),
      ),
    );
  }
}
