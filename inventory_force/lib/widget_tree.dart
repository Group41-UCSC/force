import 'package:inventory_force/constants.dart';
//import 'package:batch_work/pages/drawer/drawer_page.dart';
import 'package:inventory_force/pages/table_item/table_item_page.dart';
//import 'package:batch_sheet/pages/table_received/table_received_page.dart';
//import 'package:batch_sheet/pages/table_issued/table_issued_page.dart';
import 'package:inventory_force/widget/responsive_layout.dart';
import 'package:inventory_force/widget/app_bar_widget.dart';
//import 'package:batch_sheet/pages/dash/dash_page.dart';
import 'package:inventory_force/pages/table_tab_page.dart';
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
      /*appBar: PreferredSize(
        preferredSize: Size(double.infinity, 100),
        child: (ResponsiveLayout.isTinyLimit(context) ||
                ResponsiveLayout.isTinyHeightLimit(context))
            ? Container()
            : AppBarWidget(),
      ),*/
      body: ResponsiveLayout(
        tiny: Container(),
        phone: currentIndex == 0
            ? TableTabPage()
            : currentIndex == 1
                ? TableTabPage()
                : TableTabPage(),
        tablet: Row(
          children: [
            Expanded(
              child: TableTabPage(),
            )
          ],
        ),
        largeTablet: Row(
          children: [
            Expanded(child: TableTabPage()),
          ],
        ),
        computer: Row(
          children: [
            Expanded(
              child: TableTabPage(),
            ),
          ],
        ),
      ),
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
