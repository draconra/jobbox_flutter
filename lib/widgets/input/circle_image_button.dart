import 'package:flutter/material.dart';

class CircleImageButon extends StatelessWidget {
  // -- Props --
  final String title;
  final VoidCallback onTap;

  const CircleImageButon({
    super.key,
    required this.title,
    required this.onTap,
  });

  // -- UI --
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      customBorder: const CircleBorder(),
      onTap: onTap,
      child: Ink(
        width: 92,
        height: 92,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.transparent,
          border: Border.all(),
        ),
        child: Container(
          padding: const EdgeInsets.all(10),
          alignment: Alignment.center,
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15,
              color: Theme.of(context).colorScheme.onBackground,
              fontWeight: FontWeight.w400,
              height: 0,
            ),
          ),
        ),
      ),
    );
  }
}
