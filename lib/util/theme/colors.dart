import 'package:flutter/material.dart';

enum AppColors { orangeTint, orange, brownDark, blueTint }

extension AppColorsExtension on AppColors {
  Color get color {
    switch (this) {
      case AppColors.orangeTint:
        return const Color(0xFFFFFBF8);
      case AppColors.orange:
        return const Color(0xFFEA9E5B);
      case AppColors.brownDark:
        return const Color(0xFF4B3C2F);
      case AppColors.blueTint:
        return const Color(0xFFE9E9ED);
    }
  }
}
