import 'package:flutter/material.dart';
import 'package:royalscouts/app/modules/admin/task_module/task_evaluation/task_evaluation_page.dart';
import 'package:royalscouts/app/modules/admin/task_module/task_home_page/task_home_page.dart';
import 'package:royalscouts/app/shared/configs/custom_color.dart';
import 'package:side_navigation/side_navigation.dart';

class AdminDashboard extends StatefulWidget {
  const AdminDashboard({Key? key}) : super(key: key);

  @override
  _AdminDashboardState createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  int selectedIndex = 0;

  List<Widget> views = const [
    TaskHomePage(),
    TaskEvaluationPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Dashboard'),
        elevation: 0,
      ),
      backgroundColor: CustomColor.background,
      body: Row(
        children: [
          SideNavigationBar(
            selectedIndex: selectedIndex,
            expandable: true,
            color: CustomColor.primary,
            selectedItemColor: Colors.white,
            items: const [
              SideNavigationBarItem(
                icon: Icons.dashboard,
                label: 'Task Home',
              ),
              SideNavigationBarItem(
                icon: Icons.event_available_sharp,
                label: 'Task Evaluation',
              ),
            ],
            onTap: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
              child: views.elementAt(selectedIndex),
            ),
          ),
        ],
      ),
    );
  }
}
