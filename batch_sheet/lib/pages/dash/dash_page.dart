import 'package:flutter/material.dart';
import 'package:batch_sheet/pages/main_tab_page.dart';
import 'package:batch_sheet/pages/table_issued/table_issued_page.dart';
import 'package:batch_sheet/pages/table_list/table_list_page.dart';
import 'package:batch_sheet/pages/table_received/table_received_page.dart';
import '../../constants.dart';

class DashPage extends StatefulWidget {
  @override
  _DashPageState createState() => _DashPageState();
}

class _DashPageState extends State<DashPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        /*BottomNavigationBar(
            fixedColor: Colors.indigo,
            items: [
              BottomNavigationBarItem(
                title: Text('Add'),
                icon: Icon(Icons.add),
              ),
              BottomNavigationBarItem(
                title: Text('Reserved List'),
                icon: Icon(Icons.list_alt),
              ),
            ],
            onTap: (int index) {
              switch (index) {
                case 0:
                  break;

                case 1:
                  /*Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TableReservedPage()),
                  );*/
                  break;
              }
            }),*/
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 50, right: 3),
                child: TextButton.icon(
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.blue,
                    size: 30,
                  ),
                  label: Text('BADGE SHEET',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0)),
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
              top: Constants.kPadding,
              right: Constants.kPadding,
              left: Constants.kPadding),
          child: Card(
            color: Colors.indigo,
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Container(
              width: double.infinity,
              margin: EdgeInsets.all(50.0),
              color: Constants.light,
              padding: EdgeInsets.fromLTRB(30, 30, 30, 30),
              child: ListTile(
                title: Text("Badge sheets Count =  50 sheets"),
                subtitle: Text(
                  "20% issued",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
              top: Constants.kPadding,
              right: Constants.kPadding,
              left: Constants.kPadding),
          child: Card(
            color: Colors.indigo,
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Container(
              width: double.infinity,
              margin: EdgeInsets.all(30.0),
              color: Constants.lightGrey,
              child: RaisedButton(
                child: Text("Badge Sheet List"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MainTabPage()),
                  );
                },
                textColor: Colors.black,
                padding: EdgeInsets.fromLTRB(30, 30, 30, 30),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
