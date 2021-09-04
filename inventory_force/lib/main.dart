import 'package:flutter/material.dart';
import 'package:inventory_force/constants.dart';
import 'package:inventory_force/widget_tree.dart';
import 'package:flutter/material.dart';
import 'package:inventory_force/pages/table_tab_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Inventory Management ',
      theme: ThemeData(
          scaffoldBackgroundColor: Constants.light,
          primarySwatch: Colors.blue,
          canvasColor: Constants.light),
      home: Center(child: WidgetTree()),
    );
  }
}
