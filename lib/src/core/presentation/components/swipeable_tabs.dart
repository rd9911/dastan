import 'package:flutter/material.dart';

/// Configuration for a tab in SwipeableTabs.
class TabConfig {
  final String name;
  final IconData? icon;
  final Widget content;

  const TabConfig({required this.name, this.icon, required this.content});
}

/// A horizontal tab bar with swipeable content panels.
class SwipeableTabs extends StatefulWidget {
  /// The list of tabs to display.
  final List<TabConfig> tabs;

  /// The initially selected tab index.
  final int initialIndex;

  /// Callback when tab changes.
  final ValueChanged<int>? onTabChanged;

  const SwipeableTabs({
    super.key,
    required this.tabs,
    this.initialIndex = 0,
    this.onTabChanged,
  });

  @override
  State<SwipeableTabs> createState() => _SwipeableTabsState();
}

class _SwipeableTabsState extends State<SwipeableTabs>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: widget.tabs.length,
      vsync: this,
      initialIndex: widget.initialIndex,
    );
    _tabController.addListener(_handleTabChange);
  }

  void _handleTabChange() {
    if (!_tabController.indexIsChanging) {
      widget.onTabChanged?.call(_tabController.index);
    }
  }

  @override
  void dispose() {
    _tabController.removeListener(_handleTabChange);
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          controller: _tabController,
          tabs: widget.tabs.map((tab) {
            if (tab.icon != null) {
              return Tab(icon: Icon(tab.icon), text: tab.name);
            }
            return Tab(text: tab.name);
          }).toList(),
          labelColor: Theme.of(context).primaryColor,
          unselectedLabelColor: Colors.grey,
          indicatorColor: Theme.of(context).primaryColor,
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: widget.tabs.map((tab) => tab.content).toList(),
          ),
        ),
      ],
    );
  }
}
