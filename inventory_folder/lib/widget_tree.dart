import 'package:inventory_folder/constants.dart';
import 'package:inventory_folder/pages/drawer/drawer_page.dart';
import 'package:inventory_folder/pages/table_item/table_item_page.dart';
import 'package:inventory_folder/pages/table_request/table_request_page.dart';
import 'package:inventory_folder/pages/table_issued/table_issued_page.dart';
import 'package:inventory_folder/pages/table_received/table_received_page.dart';
import 'package:inventory_folder/responsive_layout.dart';
import 'package:inventory_folder/pages/widgets/app_bar_widget.dart';
import 'package:inventory_folder/pages/dash/dash_page.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class WidgetTree extends StatefulWidget {
  @override
  _WidgetTreeState createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  int currentIndex = 1;

  List<Widget> _icons = [
    Icon(Icons.add, size: 30),
    Icon(Icons.list, size: 30),
    Icon(Icons.compare_arrows, size: 30),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 100),
        child: (ResponsiveLayout.isTinyLimit(context) ||
                ResponsiveLayout.isTinyHeightLimit(context))
            ? Container()
            : AppBarWidget(),
      ),
      body: ResponsiveLayout(
        tiny: Container(),
        phone: currentIndex == 0
            ? DashPage()
            : currentIndex == 1
                ? DashPage()
                : DashPage(),
        tablet: Row(
          children: [
            Expanded(
              child: DashPage(),
            )
          ],
        ),
        largeTablet: Row(
          children: [
            Expanded(child: DashPage()),
          ],
        ),
        computer: Row(
          children: [
            Expanded(child: DrawerPage()),
            Expanded(
              child: DashPage(),
            ),
          ],
        ),
      ),
      drawer: DrawerPage(),
      bottomNavigationBar: ResponsiveLayout.isPhone(context)
          ? CurvedNavigationBar(
              index: currentIndex,
              backgroundColor: Constants.dark,
              items: _icons,
              onTap: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
            )
          : SizedBox(),
    );
  }
}
