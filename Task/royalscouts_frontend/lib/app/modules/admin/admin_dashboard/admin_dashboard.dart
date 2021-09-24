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
    TaskHomePage(),
    TaskHomePage(),
    TaskHomePage(),
    TaskEvaluationPage(),
    TaskHomePage(),
    TaskHomePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tasks'),
        backgroundColor: CustomColor.appBar,
        elevation: 0,
        actions: [
          Container(
            width: 72,
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.notifications),
                  ],
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.red),
                    alignment: Alignment.center,
                    child: Text('4'),
                  ),
                )
              ],
            ),
          ),
          Container(
            width: 72,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.person),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      backgroundColor: CustomColor.background,
      body: Row(
        children: [
          SideNavigationBar(
            selectedIndex: selectedIndex,
            expandable: true,
            color: Colors.white,
            selectedItemColor: Colors.black,
            items: const [
              SideNavigationBarItem(
                icon: Icons.dashboard,
                label: 'Dashboard',
              ),
              SideNavigationBarItem(
                icon: Icons.shopping_cart,
                label: 'Users',
              ),
              SideNavigationBarItem(
                icon: Icons.people,
                label: 'Events',
              ),
              SideNavigationBarItem(
                icon: Icons.bar_chart,
                label: 'Tasks',
              ),
              SideNavigationBarItem(
                icon: Icons.bar_chart,
                label: 'Tasks Evaluations',
              ),
              SideNavigationBarItem(
                icon: Icons.layers,
                label: 'Inventory',
              ),
              SideNavigationBarItem(icon: Icons.layers, label: 'Batch Work'),
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
              // child: TaskHomePage(),
            ),
          ),
        ],
      ),
    );
  }
}
