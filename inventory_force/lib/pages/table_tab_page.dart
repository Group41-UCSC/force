import 'package:inventory_force/pages/table_item/table_item_page.dart';
import 'package:inventory_force/pages/table_request/table_request_page.dart';
import 'package:inventory_force/pages/table_reserved/table_reserved_page.dart';
import 'package:inventory_force/pages/table_issued/table_issued_page.dart';
import 'package:inventory_force/widget/tabbar_widget.dart';
import 'package:inventory_force/pages/table_received/table_received_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:inventory_force/constants.dart';

class TableTabPage extends StatefulWidget {
  @override
  _TableTabPageState createState() => _TableTabPageState();
}

class _TableTabPageState extends State<TableTabPage> {
  @override
  Widget build(BuildContext context) => TabBarWidget(
        title: 'Inventory Management',
        tabs: [
          Tab(
            icon: Padding(
              padding: const EdgeInsets.fromLTRB(10.0, 0.0, 5.0, 0.0),
              child: Text(
                'Item List',
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
                'Request Items ',
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
                'Reserved  Item',
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
                'Issued Items',
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
                'Received Items',
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
            child: Center(child: TableItemPage()),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
            child: Center(child: TableRequestPage()),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
            child: Center(child: TableReservedPage()),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
            child: Center(child: TableIssuedPage()),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
            child: Center(child: TableReceivedPage()),
          ),
        ],
      );
}
