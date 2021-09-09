import 'package:flutter/material.dart';

import 'package:inventory_folder/constants.dart';
import 'package:inventory_folder/widget_tree.dart';
import 'package:flutter/material.dart';
import 'package:inventory_folder/pages/dash/dash_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Admin Panel',
      theme: ThemeData(
          scaffoldBackgroundColor: Constants.light,
          primarySwatch: Colors.blue,
          canvasColor: Constants.light),
      home: Center(child: WidgetTree()),
    );
  }
}
