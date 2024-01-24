import 'package:flutter/material.dart';

enum TabFilters { recent, nearby }

extension TabBarFiltersExtension on TabFilters {
  String get title {
    switch (this) {
      case TabFilters.recent:
        return 'Recent Jobs';
      case TabFilters.nearby:
        return 'Near You';
    }
  }
}

class FilterTabBar extends StatefulWidget {
  // -- States --
  final Function(TabFilters) onChangedTab;

  const FilterTabBar({super.key, required this.onChangedTab});

  @override
  State<FilterTabBar> createState() => _FilterTabBarState();
}

class _FilterTabBarState extends State<FilterTabBar> {
  // -- States --
  TabFilters _activeFilter = TabFilters.recent;

  // -- Actions --
  void _toggleTab(TabFilters filter) {
    setState(() {
      _activeFilter = filter;
      widget.onChangedTab(_activeFilter);
    });
  }

  // -- UI --
  Widget _tabBar(BuildContext context, TabFilters filter, VoidCallback onTap) {
    final isActive = _activeFilter == filter;
    return Expanded(
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          splashColor: Colors.transparent,
          highlightColor:
              Theme.of(context).colorScheme.primary.withOpacity(0.1),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.only(top: 12, bottom: 10),
            child: Column(
              children: [
                Text(
                  filter.title,
                  style: TextStyle(
                    color: isActive
                        ? Theme.of(context).colorScheme.secondary
                        : Theme.of(context)
                            .colorScheme
                            .onSurfaceVariant
                            .withOpacity(0.3),
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 6),
                Container(
                  width: 102,
                  height: 4.5,
                  decoration: BoxDecoration(
                    color: Theme.of(context)
                        .colorScheme
                        .secondary
                        .withOpacity(isActive ? 1 : 0),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  // color: Theme.of(context).colorScheme.secondary,
                ),
                const SizedBox(height: 8),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.background,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _tabBar(
              context, TabFilters.recent, () => _toggleTab(TabFilters.recent)),
          _tabBar(
              context, TabFilters.nearby, () => _toggleTab(TabFilters.nearby)),
        ],
      ),
    );
  }
}
