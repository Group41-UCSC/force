import 'package:flutter/cupertino.dart';
import 'package:batch_sheet/pages/table_list/data/item.dart';
import 'package:batch_sheet/widget/scrollable_widget.dart';
import 'package:batch_sheet/widget/responsive_layout.dart';
import 'package:flutter/material.dart';
import 'package:batch_sheet/widget/app_bar_widget.dart';
import 'package:batch_sheet/constants.dart';
import 'package:batch_sheet/pages/form_badge_sheet.dart';
import 'dart:core';

class TableListPage extends StatefulWidget {
  @override
  _TableListPageState createState() => _TableListPageState();
}

class _TableListPageState extends State<TableListPage> {
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
          compareString(ascending, '${item1.bookID}', '${item2.bookID}'));
    } else if (columnIndex == 1) {
      items.sort((item1, item2) =>
          compareString(ascending, '${item1.bookType}', '${item2.bookType}'));
    } else if (columnIndex == 2) {
      items.sort((item1, item2) => compareString(
          ascending, '${item1.serialNumStart}', '${item2.serialNumStart}'));
    } else if (columnIndex == 3) {
      items.sort((item1, item2) => compareString(
          ascending, '${item1.serialNumEnd}', '${item2.serialNumEnd}'));
    } else if (columnIndex == 4) {
      items.sort((item1, item2) =>
          compareString(ascending, '${item1.total}', '${item2.total}'));
    } else if (columnIndex == 5) {
      items.sort((item1, item2) => compareString(
          ascending, '${item1.issuedCount}', '${item2.issuedCount}'));
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

  void functionIssue(BuildContext context) {
    TextEditingController customController = TextEditingController();
    var mailDialog = AlertDialog(
      title: Text("Form"),
      content: Form(
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: "Serial Number"),
              controller: customController,
            ),
            /*DropdownButton(
              //decoration: InputDecoration(labelText: "Badge Sheet Type"),
              hint: Text("Select Item"),
              value: valueChoose,
              onChanged: (newValue) {
                setState(() {
                  valueChoose = newValue;
                });
              },
              items: listItem.map((valueItem) {
                return DropdownMenuItem(
                  value: valueItem,
                  child: Text(valueItem),
                );
              }).toList(),
            ),*/
            TextField(
              decoration: InputDecoration(labelText: "Badge Type"),
              controller: customController,
            ),
            TextField(
              decoration: InputDecoration(labelText: "Issue To"),
              controller: customController,
            ),
            TextField(
              decoration: InputDecoration(labelText: "Issue Date"),
              controller: customController,
            ),
            TextField(
              decoration: InputDecoration(labelText: "Examiner Name"),
              controller: customController,
            ),
          ],
        ),
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

  void functionEdit(BuildContext context) {
    TextEditingController customController = TextEditingController();
    var mailDialog = AlertDialog(
      title: Text("Form"),
      content: Form(
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: "Book Type"),
              controller: customController,
            ),
            TextField(
              decoration: InputDecoration(labelText: "Serial Number Start"),
              controller: customController,
            ),
            TextField(
              decoration: InputDecoration(labelText: "Serial Number End"),
              controller: customController,
            ),
            TextField(
              decoration: InputDecoration(labelText: "Total"),
              controller: customController,
            ),
            TextField(
              decoration: InputDecoration(labelText: "Issue Count"),
              controller: customController,
            ),
          ],
        ),
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
            label: Text("Book ID"),
            numeric: true,
            onSort: (columnIndex, ascending) {
              setState(() {
                sort = !sort;
              });
              onSort(columnIndex, ascending);
            }),
        DataColumn(
            label: Text("Book Type"),
            numeric: true,
            onSort: (columnIndex, ascending) {
              setState(() {
                sort = !sort;
              });
              onSort(columnIndex, ascending);
            }),
        DataColumn(
            label: Text("Serial Number Start"),
            numeric: false,
            onSort: (columnIndex, ascending) {
              setState(() {
                sort = !sort;
              });
              onSort(columnIndex, ascending);
            }),
        DataColumn(
            label: Text("Serial Number End"),
            numeric: false,
            onSort: (columnIndex, ascending) {
              setState(() {
                sort = !sort;
              });
              onSort(columnIndex, ascending);
            }),
        DataColumn(
            label: Text("Total"),
            numeric: false,
            onSort: (columnIndex, ascending) {
              setState(() {
                sort = !sort;
              });
              onSort(columnIndex, ascending);
            }),
        DataColumn(
            label: Text("Issued Count"),
            numeric: false,
            onSort: (columnIndex, ascending) {
              setState(() {
                sort = !sort;
              });
              onSort(columnIndex, ascending);
            }),
        DataColumn(
          label: Text("Action"),
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
                    Text(item.bookID),
                    onTap: () {
                      print('Selected ${item.bookID}');
                    },
                  ),
                  DataCell(
                    Text(item.bookType),
                    onTap: () {
                      print('Selected ${item.bookType}');
                    },
                  ),
                  DataCell(
                    Text(item.serialNumStart),
                    onTap: () {
                      print('Selected ${item.serialNumStart}');
                    },
                  ),
                  DataCell(
                    Text(item.serialNumEnd),
                    onTap: () {
                      print('Selected ${item.serialNumEnd}');
                    },
                  ),
                  DataCell(
                    Text(item.total),
                    onTap: () {
                      print('Selected ${item.total}');
                    },
                  ),
                  DataCell(
                    Text(item.issuedCount),
                    onTap: () {
                      print('Selected ${item.issuedCount}');
                    },
                  ),
                  DataCell(
                    FlatButton(
                      color: Constants.lightGrey,
                      child: Text(
                        'Issue',
                        style: TextStyle(color: Colors.black),
                      ),
                      onPressed: () {
                        functionIssue(context);
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
                    label: Text('BADGE SHEET LIST',
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
                      'Edit',
                      style: TextStyle(color: Colors.black),
                    ),
                    onPressed: () {
                      functionEdit(context);
                    },
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
