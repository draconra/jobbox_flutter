import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../util/theme/types.dart';
import '../../../util/theme/icons.dart';

import '../../../widgets/image/icon_image.dart';
import '../../../widgets/input/text_field.dart';
import '../../../widgets/navigation/filter_tab_bar.dart';
import '../../../widgets/item/job_list_item.dart';

import '../../../../model/data/job_model_data.dart';
import '../../../../model/data/user_model_data.dart';

class JobListingScreen extends StatefulWidget {
  // -- Props --
  const JobListingScreen({super.key});

  @override
  State<JobListingScreen> createState() => _JobListingScreenState();
}

class _JobListingScreenState extends State<JobListingScreen> {
  // -- States --
  final _searchEditingController = TextEditingController();
  TabFilters _activeFilterTab = TabFilters.recent;

  // -- Actions --
  void onChangedFilter(TabFilters filter) {
    setState(() {
      _activeFilterTab = filter;
    });
  }

  // -- UI --
  Widget _topBar(BuildContext context, String message) {
    final topInset = MediaQuery.of(context).padding.top;

    return Container(
      padding: EdgeInsets.only(top: topInset, left: 21, right: 21),
      width: double.infinity,
      color: Theme.of(context).colorScheme.secondary,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          Text(
            message,
            style: TextStyle(
              fontFamily: FontFamilies.poppins.name,
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: Theme.of(context).primaryColor,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            'Find The Best Job Here!',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          const SizedBox(height: 16),
          MyTextField(
            props: MyTextFieldProps(
              placeholder: 'Start searching for jobs',
              isOutlined: false,
              prefixIcon: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 11),
                child: MyIcon(
                  icon: AppIcons.magnifyingGlass,
                  length: 10,
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ),
              controller: _searchEditingController,
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final userModelData = Provider.of<UserModelData>(context);
    final jobModelData = Provider.of<JobModelData>(context);
    final jobs = (_activeFilterTab == TabFilters.nearby)
        ? jobModelData.nearbyJobs
        : jobModelData.recentJobs;

    return Container(
      color: Theme.of(context).colorScheme.background,
      child: Column(
        children: [
          _topBar(context, userModelData.greeting),
          FilterTabBar(onChangedTab: onChangedFilter),
          Flexible(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 0),
              itemBuilder: (_, index) => JobListItem(job: jobs[index]),
              itemCount: jobs.length,
            ),
          ),
        ],
      ),
    );
  }
}
