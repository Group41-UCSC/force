import 'package:force_inventory_management/page/editable_page.dart';
import 'package:force_inventory_management/page/reserve_page.dart';
import 'package:force_inventory_management/widget/tabbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight
  ]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final String title = 'Inventory Management';

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        theme: ThemeData(primarySwatch: Colors.indigo),
        home: MainPage(),
      );
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
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
                    color: Colors.amber),
              ),
            ),
          ),
          Tab(
            icon: Padding(
              padding: const EdgeInsets.fromLTRB(10.0, 0.0, 5.0, 0.0),
              child: Text(
                'Requested List',
                style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.amber),
              ),
            ),
          )
        ],
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(300.0, 20.0, 20.0, 20.0),
            child: Center(child: EditablePage()),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(300.0, 20.0, 20.0, 20.0),
            child: Center(child: ReservePage()),
          ),
        ],
      );
}
