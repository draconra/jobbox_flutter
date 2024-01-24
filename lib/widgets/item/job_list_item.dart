import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../util/theme/icons.dart';
import '../../views/home/job_listing/job_detail_sheet.dart';
import '../image/icon_image.dart';
import '../../../model/job.dart';

class JobListItem extends StatelessWidget {
  // -- Props --
  final Job job;
  final bool enabled;

  const JobListItem({
    super.key,
    required this.job,
    this.enabled = true,
  });

  // -- Actions --
  void onTapItem(BuildContext context) {
    final size = MediaQuery.of(context).size;
    if (!enabled) {
      return;
    }
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      backgroundColor: Theme.of(context).colorScheme.surface,
      constraints: BoxConstraints.tight(Size(size.width, size.height * 0.7)),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(28),
          topRight: Radius.circular(28),
        ),
      ),
      builder: (_) => JobDetailSheet(job: job),
    );
  }

  // -- UI --
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          left: 5,
          right: 5,
          top: 5,
          bottom: 5,
          child: Container(
            width: 1,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.02),
                  spreadRadius: 2,
                  blurRadius: 10,
                  offset: const Offset(0, 1),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 16, left: 16, right: 12),
          child: Material(
            color: Theme.of(context).colorScheme.surface,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: InkWell(
              borderRadius: BorderRadius.circular(10),
              splashColor: Colors.transparent,
              highlightColor:
                  Theme.of(context).colorScheme.primary.withOpacity(0.05),
              onTap: () => onTapItem(context),
              child: Container(
                padding: const EdgeInsets.only(
                    left: 21, right: 21, top: 14, bottom: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          job.companyName.toUpperCase(),
                          style: Theme.of(context).textTheme.labelSmall,
                        ),
                        Text(
                          DateFormat('dd MMM yyyy').format(job.datePosted),
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium
                              ?.copyWith(fontSize: 14, letterSpacing: -0.8),
                        ),
                      ],
                    ),
                    const SizedBox(height: 2),
                    Text(
                      job.positionTitle,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Row(
                          children: [
                            MyIcon(
                              icon: AppIcons.sack,
                              length: 16,
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSurfaceVariant,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              job.salaryDescription,
                              style: Theme.of(context).textTheme.labelMedium,
                            ),
                          ],
                        ),
                        const SizedBox(width: 12),
                        Flexible(
                          child: Text(
                            job.location,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
