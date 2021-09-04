import 'package:flutter/material.dart';
import 'package:batch_sheet/pages/award_tab_page.dart';
import 'package:batch_sheet/pages/table_issued/table_issued_page.dart';
import 'package:batch_sheet/pages/table_list//table_list_page.dart';
import 'package:batch_sheet/pages/table_received/table_received_page.dart';
import '../../constants.dart';

class DashPageRight extends StatefulWidget {
  @override
  _DashPageRightState createState() => _DashPageRightState();
}

class _DashPageRightState extends State<DashPageRight> {
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
                  label: Text('BADGE AWARDED',
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
                title: Text("Badge Awarded Count =  20 Awarded"),
                subtitle: Text(
                  "20% pending awards.",
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
                child: Text("Badge Awarded List"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AwardTabPage()),
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
