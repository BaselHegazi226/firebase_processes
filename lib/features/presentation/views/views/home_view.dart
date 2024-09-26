import 'package:copy_firebase_process/features/presentation/views/widgets/home/tab_bar_section.dart';
import 'package:flutter/material.dart';

import 'add_view.dart';
import 'emp_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});
  static const id = '/homeView';
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(
      initialIndex: 0,
      length: 2,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: TabBarView(
                controller: tabController,
                children: const [
                  AddView(),
                  EmpView(),
                ],
              ),
            ),
            TabBarSection(
              tabController: tabController,
            ),
          ],
        ),
      ),
    );
  }
}
