import 'package:inventory_folder/pages/table_request/widget/item.dart';
import 'package:inventory_folder/utils.dart';
import 'package:inventory_folder/pages/widgets/scrollable_widget.dart';
import 'package:inventory_folder/responsive_layout.dart';
import 'package:flutter/material.dart';
import 'package:inventory_folder/pages/widgets/app_bar_widget.dart';
import 'package:inventory_folder/pages/table_reserved/table_reserved_page.dart';
import 'package:inventory_folder/pages/form/form_screen.dart';
import '../../constants.dart';

class TableRequestPage extends StatefulWidget {
  @override
  _TableRequestPageState createState() => _TableRequestPageState();
}

class _TableRequestPageState extends State<TableRequestPage> {
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
          compareString(ascending, '${item1.itemID}', '${item2.itemID}'));
    } else if (columnIndex == 1) {
      items.sort((item1, item2) =>
          compareString(ascending, '${item1.itemName}', '${item2.itemName}'));
    } else if (columnIndex == 2) {
      items.sort((item1, item2) =>
          compareString(ascending, '${item1.event}', '${item2.event}'));
    } else if (columnIndex == 3) {
      items.sort((item1, item2) => compareString(
          ascending, '${item1.requestedBy}', '${item2.requestedBy}'));
    } else if (columnIndex == 4) {
      items.sort((item1, item2) => compareString(
          ascending, '${item1.requestedDate}', '${item2.requestedDate}'));
    } else if (columnIndex == 5) {
      items.sort((item1, item2) =>
          compareString(ascending, '${item1.quantity}', '${item2.quantity}'));
    } else if (columnIndex == 6) {
      items.sort((item1, item2) =>
          compareString(ascending, '${item1.status}', '${item2.status}'));
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
            label: Text("Item ID"),
            numeric: true,
            onSort: (columnIndex, ascending) {
              setState(() {
                sort = !sort;
              });
              onSort(columnIndex, ascending);
            }),
        DataColumn(
            label: Text("Item NAME"),
            numeric: true,
            onSort: (columnIndex, ascending) {
              setState(() {
                sort = !sort;
              });
              onSort(columnIndex, ascending);
            }),
        DataColumn(
            label: Text("Event"),
            numeric: false,
            onSort: (columnIndex, ascending) {
              setState(() {
                sort = !sort;
              });
              onSort(columnIndex, ascending);
            }),
        DataColumn(
            label: Text("Request By"),
            numeric: false,
            onSort: (columnIndex, ascending) {
              setState(() {
                sort = !sort;
              });
              onSort(columnIndex, ascending);
            }),
        DataColumn(
            label: Text("Requested Date"),
            numeric: false,
            onSort: (columnIndex, ascending) {
              setState(() {
                sort = !sort;
              });
              onSort(columnIndex, ascending);
            }),
        DataColumn(
            label: Text("Quantity"),
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
            onSort: (columnIndex, ascending) {
              setState(() {
                sort = !sort;
              });
              onSort(columnIndex, ascending);
            }),
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
                    Text(item.itemID),
                    onTap: () {
                      print('Selected ${item.itemID}');
                    },
                  ),
                  DataCell(
                    Text(item.itemName),
                    onTap: () {
                      print('Selected ${item.itemName}');
                    },
                  ),
                  DataCell(
                    Text(item.event),
                    onTap: () {
                      print('Selected ${item.event}');
                    },
                  ),
                  DataCell(
                    Text(item.requestedBy),
                    onTap: () {
                      print('Selected ${item.requestedBy}');
                    },
                  ),
                  DataCell(
                    Text(item.requestedDate),
                    onTap: () {
                      print('Selected ${item.requestedDate}');
                    },
                  ),
                  DataCell(
                    Text(item.quantity),
                    onTap: () {
                      print('Selected ${item.quantity}');
                    },
                  ),
                  DataCell(
                    Text(item.status),
                    onTap: () {
                      print('Selected ${item.status}');
                    },
                  ),
                ]),
          )
          .toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 100),
        child: (ResponsiveLayout.isTinyLimit(context) ||
                ResponsiveLayout.isTinyHeightLimit(context))
            ? Container()
            : AppBarWidget(),
      ),
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
                    functionButton(context);
                    break;
                  case 2:
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
                    label: Text('REQUEST ITEM LIST',
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
                      'Reserve',
                      style: TextStyle(color: Colors.black),
                    ),
                    onPressed: () {
                      functionButton(context);
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 50, left: 3),
                  child: FlatButton(
                    color: Constants.lightGrey,
                    child: Text(
                      'Reject',
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