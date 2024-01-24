import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../theme/colors.dart';
import '../../../../theme/icons.dart';
import '../../../../theme/dimensions.dart';

import './job_application/job_application_1_screen.dart';
import '../../../reusable_comps/input/filled_button.dart';
import '../../../reusable_comps/input/icon_box_button.dart';
import '../../../reusable_comps/visual/logo_image.dart';

import '../../../../model/job.dart';

import '../../../../model_data/user_model_data.dart';

class JobDetailSheet extends StatelessWidget {
  // -- Props --
  final Job job;

  const JobDetailSheet({super.key, required this.job});

  // -- Actions --
  void _onTapApply(BuildContext context) {
    Navigator.pop(context);
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => JobApplicationSheet1(job: job),
        fullscreenDialog: true,
      ),
    );
  }

  void _onTapBookmark() {}

  // -- UI --
  Widget _header(BuildContext context, String title) {
    return Container(
      width: double.infinity,
      alignment: Alignment.topLeft,
      child: Text(
        title,
        style: Theme.of(context).textTheme.headlineMedium,
      ),
    );
  }

  Widget _topBar() {
    return Positioned(
      top: 0,
      right: 0,
      left: 0,
      child: Container(
        width: double.infinity,
        color: Colors.white,
        child: Align(
          alignment: Alignment.center,
          child: Container(
            height: 5.5,
            width: 148,
            margin: const EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              color: AppColors.blueTint.color,
              borderRadius: BorderRadius.circular(50),
            ),
          ),
        ),
      ),
    );
  }

  Widget _content(BuildContext context, ThemeData theme) {
    final bottomInset = MediaQuery.of(context).padding.bottom + 52;

    return Padding(
      padding: EdgeInsets.only(bottom: bottomInset + Dimensions.bottomPadding),
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 36),
                MyLogo(logo: job.logo),
                const SizedBox(height: 20),
                Text(
                  job.companyName.toUpperCase(),
                  style: theme.textTheme.labelSmall?.copyWith(fontSize: 16),
                ),
                Text(
                  job.positionTitle,
                  style: theme.textTheme.titleMedium,
                ),
                const SizedBox(height: 2),
                Text(
                  job.location,
                  style: theme.textTheme.labelMedium?.copyWith(fontSize: 16),
                ),
                const SizedBox(height: 24),
                _header(context, 'Job Description'),
                const SizedBox(height: 4),
                Text(
                  job.description,
                  style: theme.textTheme.bodyMedium,
                ),
                const SizedBox(height: 16),
                _header(context, 'Requirements'),
                const SizedBox(height: 4),
                ...job.requirements
                    .map((requirement) => Text('- $requirement'))
                    .toList(),
              ],
            ),
          ),
          IgnorePointer(
            child: Container(
              width: double.infinity,
              height: 84,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.white.withOpacity(0.1),
                    Colors.white,
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _bottomBar(BuildContext context, ThemeData theme, bool hasApplied) {
    final bottomInset = MediaQuery.of(context).padding.bottom;
    return Positioned(
      bottom: bottomInset + Dimensions.bottomPadding,
      left: 0,
      right: 0,
      child: Row(
        children: [
          Flexible(
            child: MyFilledButton(
              title: hasApplied ? 'Applied' : 'Apply This Job',
              onTap: () => _onTapApply(context),
              enabled: !hasApplied,
            ),
          ),
          const SizedBox(width: 12),
          IconBoxButton(
            icon: AppIcons.bookmark,
            onTap: () => _onTapBookmark(),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final theme = Theme.of(context);
    final userModelData = Provider.of<UserModelData>(context);

    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(28),
        topRight: Radius.circular(28),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Stack(
          children: [
            _content(context, theme),
            _topBar(),
            _bottomBar(
              context,
              theme,
              userModelData.isJobApplied(
                job,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
