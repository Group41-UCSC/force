import 'package:batch_sheet/pages/table_list/table_list_page.dart';
import 'package:batch_sheet/pages/table_award/table_award_page.dart';
import 'package:batch_sheet/widget/tabbar_widget.dart';
import 'package:batch_sheet/pages/table_received/table_received_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:batch_sheet/constants.dart';

class AwardTabPage extends StatefulWidget {
  @override
  _AwardTabPageState createState() => _AwardTabPageState();
}

class _AwardTabPageState extends State<AwardTabPage> {
  @override
  Widget build(BuildContext context) => TabBarWidget(
        title: 'Badge Awarded List',
        tabs: [
          Tab(
            icon: Padding(
              padding: const EdgeInsets.fromLTRB(10.0, 0.0, 5.0, 0.0),
              child: Text(
                'Awards',
                style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                  color: Constants.light,
                ),
              ),
            ),
          ),
        ],
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
            child: Center(child: TableAwardPage()),
          ),
        ],
      );
}
