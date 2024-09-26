import 'package:copy_firebase_process/features/presentation/views/widgets/home/tab_bar_item.dart';
import 'package:flutter/material.dart';

class TabBarSection extends StatelessWidget {
  const TabBarSection({
    super.key,
    required this.tabController,
  });
  final TabController tabController;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: TabBar(
        controller: tabController,
        indicator: BoxDecoration(
          color: Colors.blueGrey.withOpacity(.1),
          borderRadius: BorderRadius.circular(16),
        ),
        indicatorPadding: const EdgeInsets.only(bottom: 24),
        dividerHeight: 2,
        dividerColor: Colors.transparent,
        splashFactory: NoSplash.splashFactory,
        tabs: const [
          TabBarItem(
            icon: Icons.home,
            text: 'Home',
          ),
          TabBarItem(
            icon: Icons.person,
            text: 'Employees',
          ),
        ],
      ),
    );
  }
}
