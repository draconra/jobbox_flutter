import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../util/theme/icons.dart';

import '../../../../widgets/item/job_list_item.dart';
import '../../../../widgets/image/icon_image.dart';

import '../../../../model/data/user_model_data.dart';

class AppliedJobsScreen extends StatelessWidget {
  const AppliedJobsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userModelData = Provider.of<UserModelData>(context);
    final appliedJobsCount = userModelData.appliedJobs.length;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        elevation: 0,
        title: Row(
          children: [
            Text(
              'Your Applied Jobs',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const SizedBox(width: 8),
            MyIcon(
              icon: AppIcons.pen,
              length: 24,
              color: Theme.of(context).colorScheme.onBackground,
            ),
            const Spacer()
          ],
        ),
      ),
      body: Column(
        children: [
          if (appliedJobsCount > 0)
            Padding(
              padding: const EdgeInsets.only(left: 21, right: 21, bottom: 18),
              child: Row(children: [
                Text(
                  'You Applied for',
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                const SizedBox(width: 6),
                Text(
                  '${userModelData.appliedJobs.length}',
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium
                      ?.copyWith(fontWeight: FontWeight.w700),
                ),
                const SizedBox(width: 6),
                Text(
                  "job${appliedJobsCount > 1 ? 's' : ''}",
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ]),
            ),
          Flexible(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 0),
              itemBuilder: (_, index) => JobListItem(
                job: userModelData.appliedJobs[index],
                enabled: false,
              ),
              itemCount: userModelData.appliedJobs.length,
            ),
          )
        ],
      ),
    );
  }
}
