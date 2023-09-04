import 'package:flutter/material.dart';

class BuildTabBarInTabBarWidget extends StatelessWidget {
  const BuildTabBarInTabBarWidget({
    super.key,
    required TabController tabController,
  }) : _tabController = tabController;

  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: _tabController,
      dividerColor: Colors.transparent,
      indicator: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color.fromARGB(255, 189, 5, 5),
      ),
      labelColor: Colors.white,
      unselectedLabelColor: Colors.black,
      indicatorSize: TabBarIndicatorSize.tab,
      tabs: const [
        Tab(
          text: 'Document',
        ),
        Tab(
          text: 'Parcel',
        )
      ],
    );
  }
}
