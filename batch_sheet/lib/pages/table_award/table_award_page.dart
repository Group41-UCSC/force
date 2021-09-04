import 'package:flutter/cupertino.dart';
import 'package:batch_sheet/pages/table_award/data/item.dart';
import 'package:batch_sheet/widget/scrollable_widget.dart';
import 'package:batch_sheet/widget//responsive_layout.dart';
import 'package:flutter/material.dart';
import 'package:batch_sheet/widget/app_bar_widget.dart';
import 'package:batch_sheet/pages/form_badge_sheet.dart';
import 'package:batch_sheet/constants.dart';

class TableAwardPage extends StatefulWidget {
  @override
  _TableAwardPageState createState() => _TableAwardPageState();
}

class _TableAwardPageState extends State<TableAwardPage> {
  late List<Item> items;
  late List<Item> selectedItems;
  late bool sort;
  int? sortColumnIndex;
  bool isAscending = false;
  @override
  void initState() {
    sort = false;
    selectedItems = [];
    items = Item.getItems();
    super.initState();
  }

  void onSort(int columnIndex, bool ascending) {
    if (columnIndex == 0) {
      items.sort((item1, item2) =>
          compareString(ascending, '${item1.serialNum}', '${item2.serialNum}'));
    } else if (columnIndex == 1) {
      items.sort((item1, item2) => compareString(
          ascending, '${item1.awardedDate}', '${item2.awardedDate}'));
    } else if (columnIndex == 2) {
      items.sort((item1, item2) =>
          compareString(ascending, '${item1.awardedTo}', '${item2.awardedTo}'));
    }
    setState(() {
      this.sortColumnIndex = columnIndex;
      this.isAscending = ascending;
    });
  }

  int compareString(bool ascending, String value1, String value2) =>
      ascending ? value1.compareTo(value2) : value2.compareTo(value1);

  void functionButton(BuildContext context) {
    TextEditingController customController = TextEditingController();
    var mailDialog = AlertDialog(
      title: Text("Your Message"),
      content: TextField(
        controller: customController,
      ),
      actions: <Widget>[
        MaterialButton(
          color: Constants.lightGrey,
          elevation: 5.0,
          child: Text('Submit'),
          onPressed: () {},
        )
      ],
    );
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return mailDialog;
        });
  }

  onSelectedRow(bool selected, Item item) async {
    setState(() {
      if (selected) {
        selectedItems.add(item);
      } else {
        selectedItems.remove(item);
      }
    });
  }

  DataTable dataBody() {
    return DataTable(
      sortAscending: isAscending,
      sortColumnIndex: sortColumnIndex,
      columns: [
        DataColumn(
            label: Text("Serial Number"),
            numeric: true,
            onSort: (columnIndex, ascending) {
              setState(() {
                sort = !sort;
              });
              onSort(columnIndex, ascending);
            }),
        DataColumn(
            label: Text("Awarded Date"),
            numeric: true,
            onSort: (columnIndex, ascending) {
              setState(() {
                sort = !sort;
              });
              onSort(columnIndex, ascending);
            }),
        DataColumn(
            label: Text("Awarded To"),
            numeric: false,
            onSort: (columnIndex, ascending) {
              setState(() {
                sort = !sort;
              });
              onSort(columnIndex, ascending);
            }),
        DataColumn(
          label: Text("Status"),
          numeric: false,
          /*onSort: (columnIndex, ascending) {
              setState(() {
                sort = !sort;
              });
              onSort(columnIndex, ascending);
            }*/
        ),
      ],
      rows: items
          .map(
            (item) => DataRow(
                selected: selectedItems.contains(item),
                onSelectChanged: (b) {
                  print("Onselect");
                  onSelectedRow(b!, item);
                },
                cells: [
                  DataCell(
                    Text(item.serialNum),
                    onTap: () {
                      print('Selected ${item.serialNum}');
                    },
                  ),
                  DataCell(
                    Text(item.awardedDate),
                    onTap: () {
                      print('Selected ${item.awardedDate}');
                    },
                  ),
                  DataCell(
                    Text(item.awardedTo),
                    onTap: () {
                      print('Selected ${item.awardedTo}');
                    },
                  ),
                  DataCell(
                    FlatButton(
                      color: Constants.lightGrey,
                      child: Text(
                        'Received',
                        style: TextStyle(color: Colors.black),
                      ),
                      onPressed: () {
                        functionButton(context);
                      },
                    ),
                  ),
                ]),
          )
          .toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: PreferredSize(
        preferredSize: Size(double.infinity, 100),
        child: (ResponsiveLayout.isTinyLimit(context) ||
                ResponsiveLayout.isTinyHeightLimit(context))
            ? Container()
            : AppBarWidget(),
      ),*/
      body: SingleChildScrollView(
        child: Column(children: [
          BottomNavigationBar(
              fixedColor: Colors.indigo,
              items: [
                BottomNavigationBarItem(
                  title: Text('Add'),
                  icon: Icon(Icons.add),
                ),
                BottomNavigationBarItem(
                  title: Text('Search'),
                  icon: Icon(Icons.search),
                ),
              ],
              onTap: (int index) {
                switch (index) {
                  case 0:
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FormBadgeSheet()),
                    );
                    break;
                  case 1:
                    functionButton(context);
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
                    label: Text('Badges Awarded List',
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
                Padding(
                  padding: EdgeInsets.only(top: 50, right: 4),
                  child: Text(
                    '                                                   ',
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 50, right: 3),
                  child: FlatButton(
                    color: Constants.lightGrey,
                    child: Text(
                      'Cancel',
                      style: TextStyle(color: Colors.black),
                    ),
                    onPressed: () {
                      functionButton(context);
                    },
                  ),
                ),
              ],
            ),
          ),
          ScrollableWidget(child: dataBody()),
        ]),
      ),
    );
  }
}
