import 'package:flutter/material.dart';
import 'package:kargomkolay_tracking_app/features/price/presentation/views/widgets/build_tab_bar_in_tab_bar_widget.dart';

class TabBarSwitcher extends StatelessWidget {
  const TabBarSwitcher({
    super.key,
    required TabController tabController,
  }) : _tabController = tabController;

  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(
          10.0,
        ),
      ),
      child: BuildTabBarInTabBarWidget(tabController: _tabController),
    );
  }
}
