import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../util/theme/icons.dart';
import '../authentication/login_screen.dart';
import './job_listing/job_listing_screen.dart';
import './applied_jobs/applied_jobs_screen.dart';
import './user_profile/user_profile_screen.dart';
import '../../../widgets/image/icon_image.dart';
import '../../../model/data/user_model_data.dart';

enum TabScreens { jobListing, appliedJobs, profile }

extension TabScreenExtension on TabScreens {
  String get title {
    switch (this) {
      case TabScreens.jobListing:
        return 'Job Listings';
      case TabScreens.appliedJobs:
        return 'Applied Jobs';
      case TabScreens.profile:
        return 'Profile';
    }
  }
}

class Home extends StatefulWidget {
  // -- Props --
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // -- States --
  var _selectedTabScreen = TabScreens.jobListing;

  Widget get _activeTabScreen {
    switch (_selectedTabScreen) {
      case TabScreens.jobListing:
        return const JobListingScreen();
      case TabScreens.appliedJobs:
        return const AppliedJobsScreen();
      case TabScreens.profile:
        return const UserProfileScreen();
    }
  }

  // -- Actions --
  void onTapTab(int selectedIndex) {
    setState(() {
      _selectedTabScreen = TabScreens.values[selectedIndex];
    });
  }

  // -- UI --
  BottomNavigationBarItem _navigationBarItem(TabScreens screen, AppIcons icon) {
    final colorScheme = Theme.of(context).colorScheme;
    return BottomNavigationBarItem(
      label: screen.title,
      icon: Padding(
        padding: const EdgeInsets.only(bottom: 4),
        child: MyIcon(
          icon: icon,
          length: 24,
          color: (_selectedTabScreen == screen)
              ? colorScheme.secondary
              : colorScheme.onBackground.withOpacity(0.4),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final userModelData = Provider.of<UserModelData>(context);

    if (userModelData.isLoggedIn) {
      return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: _activeTabScreen,
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Theme.of(context).colorScheme.surface,
          selectedItemColor: Theme.of(context).colorScheme.secondary,
          items: [
            _navigationBarItem(TabScreens.jobListing, AppIcons.list),
            _navigationBarItem(TabScreens.appliedJobs, AppIcons.pen),
            _navigationBarItem(TabScreens.profile, AppIcons.user),
          ],
          onTap: onTapTab,
          currentIndex: _selectedTabScreen.index,
        ),
      );
    } else {
      return const LoginScreen();
    }
  }
}
