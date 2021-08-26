import 'package:flutter/material.dart';
import 'package:royalscouts/app/modules/admin/admin_home/evaluation_tab.dart';

import 'home_tab.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({Key? key}) : super(key: key);

  @override
  _AdminHomeState createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = new TabController(vsync: this, length: 2);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            controller: _tabController,
            tabs: [
              Tab(text: 'Home'),
              Tab(text: 'Evaluation'),
            ],
          ),
          title: const Text('Program Item Pool'),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            HomeTab(),
            EvaluationTab(),
          ],
        ),
      ),
    );
  }
}
