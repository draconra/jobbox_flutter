import 'package:flutter/material.dart';

enum JobApplicationSteps { uploadDocs, employmentInfo, reviewInfo }

extension JobApplicationStepsExtension on JobApplicationSteps {
  String get title {
    switch (this) {
      case JobApplicationSteps.uploadDocs:
        return 'Uploading of Documents';
      case JobApplicationSteps.employmentInfo:
        return 'Emplyoment Information';
      case JobApplicationSteps.reviewInfo:
        return 'Review Information';
    }
  }
}

class StepIndicator extends StatelessWidget {
  // -- Props --
  final JobApplicationSteps step;
  final double height;

  const StepIndicator({
    super.key,
    required this.step,
    this.height = 4.5,
  });

  double get widthFactor {
    return (step.index + 1) / 3.0;
  }

  // -- Actions --
  void _onTapProceed() {}

  // -- UI --
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          step.title,
          style: Theme.of(context).textTheme.labelSmall?.copyWith(
                fontWeight: FontWeight.w400,
                fontSize: 15,
                letterSpacing: 0.2,
              ),
        ),
        const SizedBox(height: 8),
        Stack(
          alignment: AlignmentDirectional.topStart,
          children: [
            Container(
              width: double.infinity,
              height: height,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Theme.of(context).colorScheme.secondary.withOpacity(0.3),
              ),
            ),
            FractionallySizedBox(
              widthFactor: widthFactor,
              child: Container(
                height: height,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
