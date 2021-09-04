import 'package:batch_sheet/constants.dart';
//import 'package:batch_work/pages/drawer/drawer_page.dart';
import 'package:batch_sheet/pages/table_list/table_list_page.dart';
import 'package:batch_sheet/pages/table_received/table_received_page.dart';
import 'package:batch_sheet/pages/table_issued/table_issued_page.dart';

import 'package:batch_sheet/widget/responsive_layout.dart';
import 'package:batch_sheet/widget/app_bar_widget.dart';
import 'package:batch_sheet/pages/dash/dash_page.dart';
import 'package:batch_sheet/pages/dash/dash_page._right.dart';
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
                : DashPageRight(),
        tablet: Row(
          children: [
            Expanded(child: DashPage()),
            Expanded(
              child: DashPageRight(),
            )
          ],
        ),
        largeTablet: Row(
          children: [
            Expanded(child: DashPage()),
            Expanded(child: DashPageRight()),
          ],
        ),
        computer: Row(
          children: [
            //Expanded(child: DrawerPage()),
            Expanded(
              child: DashPage(),
            ),
            Expanded(
              child: DashPageRight(),
            ),
          ],
        ),
      ),
      //drawer: DrawerPage(),
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
