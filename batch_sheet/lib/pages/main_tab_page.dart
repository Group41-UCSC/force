import 'package:batch_sheet/pages/table_list/table_list_page.dart';
import 'package:batch_sheet/pages/table_issued/table_issued_page.dart';
import 'package:batch_sheet/widget/tabbar_widget.dart';
import 'package:batch_sheet/pages/table_received/table_received_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:batch_sheet/constants.dart';

class MainTabPage extends StatefulWidget {
  @override
  _MainTabPageState createState() => _MainTabPageState();
}

class _MainTabPageState extends State<MainTabPage> {
  @override
  Widget build(BuildContext context) => TabBarWidget(
        title: 'Badge Sheet Management',
        tabs: [
          Tab(
            icon: Padding(
              padding: const EdgeInsets.fromLTRB(10.0, 0.0, 5.0, 0.0),
              child: Text(
                'Badge Sheet List',
                style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                  color: Constants.light,
                ),
              ),
            ),
          ),
          Tab(
            icon: Padding(
              padding: const EdgeInsets.fromLTRB(10.0, 0.0, 5.0, 0.0),
              child: Text(
                'Issued Badge sheet',
                style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                    color: Constants.light),
              ),
            ),
          ),
          Tab(
            icon: Padding(
              padding: const EdgeInsets.fromLTRB(10.0, 0.0, 5.0, 0.0),
              child: Text(
                'Received Badge Sheet',
                style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                    color: Constants.light),
              ),
            ),
          )
        ],
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
            child: Center(child: TableListPage()),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
            child: Center(child: TableIssuedPage()),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
            child: Center(child: TableRequestPage()),
          ),
        ],
      );
}
