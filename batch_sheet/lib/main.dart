import 'package:flutter/material.dart';
import 'package:batch_sheet/constants.dart';
import 'package:batch_sheet/widget_tree.dart';
import 'package:flutter/material.dart';
import 'package:batch_sheet/pages/dash/dash_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Batch Sheet',
      theme: ThemeData(
          scaffoldBackgroundColor: Constants.light,
          primarySwatch: Colors.blue,
          canvasColor: Constants.light),
      home: Center(child: WidgetTree()),
    );
  }
}
