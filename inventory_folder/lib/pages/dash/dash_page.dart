import 'package:flutter/material.dart';
import 'package:inventory_folder/pages/form/form_screen.dart';
import 'package:inventory_folder/pages/table_issued/table_issued_page.dart';
import 'package:inventory_folder/pages/table_item/table_item_page.dart';
import 'package:inventory_folder/pages/table_request/table_request_page.dart';
import 'package:inventory_folder/pages/table_received/table_received_page.dart';
import 'package:inventory_folder/pages/table_reserved/table_reserved_page.dart';
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
        BottomNavigationBar(
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FormScreen()),
                  );
                  break;

                case 1:
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TableReservedPage()),
                  );
                  break;
              }
            }),
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
                  label: Text('INVENTORY MANAGEMENT',
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
            color: Constants.light,
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Container(
              width: double.infinity,
              margin: EdgeInsets.all(20.0),
              color: Constants.lightGrey,
              child: RaisedButton(
                child: Text("Item List"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TableItemPage()),
                  );
                },
                textColor: Colors.black,
                padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
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
            color: Constants.light,
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Container(
              width: double.infinity,
              margin: EdgeInsets.all(20.0),
              color: Constants.lightGrey,
              child: RaisedButton(
                child: Text("Requested List"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TableRequestPage()),
                  );
                },
                textColor: Colors.black,
                padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
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
            color: Constants.light,
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Container(
              width: double.infinity,
              margin: EdgeInsets.all(20.0),
              color: Constants.lightGrey,
              child: RaisedButton(
                child: Text("Issued List"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Center(child: TableIssuedPage())),
                  );
                },
                textColor: Colors.black,
                padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
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
            color: Constants.light,
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Container(
              width: double.infinity,
              margin: EdgeInsets.all(20.0),
              color: Constants.lightGrey,
              child: RaisedButton(
                child: Text("Received List"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TableReceivedPage()),
                  );
                },
                textColor: Colors.black,
                padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
