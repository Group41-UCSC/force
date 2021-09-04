import 'package:inventory_force/pages/table_item/widget/item.dart';
import 'package:inventory_force/utils.dart';
import 'package:inventory_force/widget/scrollable_widget.dart';
import 'package:inventory_force/widget/responsive_layout.dart';
import 'package:flutter/material.dart';
import 'package:inventory_force/widget/app_bar_widget.dart';
import 'package:inventory_force/pages/form/form_edit.dart';
import 'package:inventory_force/pages/table_reserved/table_reserved_page.dart';
import 'package:inventory_force/pages/form/form_screen.dart';
import '../../constants.dart';

class TableItemPage extends StatefulWidget {
  @override
  _TableItemPageState createState() => _TableItemPageState();
}

class _TableItemPageState extends State<TableItemPage> {
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
          compareString(ascending, '${item1.source}', '${item2.source}'));
    } else if (columnIndex == 3) {
      items.sort((item1, item2) => compareString(
          ascending, '${item1.inventoryID}', '${item2.inventoryID}'));
    } else if (columnIndex == 4) {
      items.sort((item1, item2) =>
          compareString(ascending, '${item1.storageID}', '${item2.storageID}'));
    } else if (columnIndex == 4) {
      items.sort((item1, item2) =>
          compareString(ascending, '${item1.quantity}', '${item2.quantity}'));
    } else if (columnIndex == 4) {
      items.sort((item1, item2) =>
          compareString(ascending, '${item1.lifespan}', '${item2.lifespan}'));
    } else if (columnIndex == 4) {
      items.sort((item1, item2) =>
          compareString(ascending, '${item1.price}', '${item2.price}'));
    } else if (columnIndex == 4) {
      items.sort((item1, item2) =>
          compareString(ascending, '${item1.build}', '${item2.build}'));
    } else if (columnIndex == 4) {
      items.sort((item1, item2) =>
          compareString(ascending, '${item1.status}', '${item2.status}'));
    } else if (columnIndex == 4) {
      items.sort((item1, item2) => compareString(
          ascending, '${item1.description}', '${item2.description}'));
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

  void functionEdit(BuildContext context) {
    TextEditingController customController = TextEditingController();
    var mailDialog = AlertDialog(
      title: Text("Form"),
      content: Form(
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(labelText: "Item Id"),
                controller: customController,
              ),
              TextField(
                decoration: InputDecoration(labelText: "Item Name"),
                controller: customController,
              ),
              TextField(
                decoration: InputDecoration(labelText: "Source"),
                controller: customController,
              ),
              TextField(
                decoration: InputDecoration(labelText: "Inventory ID"),
                controller: customController,
              ),
              TextField(
                decoration: InputDecoration(labelText: "Storage ID"),
                controller: customController,
              ),
              TextField(
                decoration: InputDecoration(labelText: "Quantity"),
                controller: customController,
              ),
              TextField(
                decoration: InputDecoration(labelText: "Life Span"),
                controller: customController,
              ),
              TextField(
                decoration: InputDecoration(labelText: "Price"),
                controller: customController,
              ),
              TextField(
                decoration: InputDecoration(labelText: "Build"),
                controller: customController,
              ),
              TextField(
                decoration: InputDecoration(labelText: "Status"),
                controller: customController,
              ),
              TextField(
                decoration: InputDecoration(labelText: "Description"),
                controller: customController,
              ),
            ],
          ),
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

  deleteSelected() async {
    setState(() {
      if (selectedItems.isNotEmpty) {
        List<Item> temp = [];
        temp.addAll(selectedItems);
        for (Item user in temp) {
          items.remove(user);
          selectedItems.remove(user);
        }
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
            label: Text("Item Name"),
            numeric: true,
            onSort: (columnIndex, ascending) {
              setState(() {
                sort = !sort;
              });
              onSort(columnIndex, ascending);
            }),
        DataColumn(
            label: Text("Source"),
            numeric: false,
            onSort: (columnIndex, ascending) {
              setState(() {
                sort = !sort;
              });
              onSort(columnIndex, ascending);
            }),
        DataColumn(
            label: Text("Inventory ID"),
            numeric: false,
            onSort: (columnIndex, ascending) {
              setState(() {
                sort = !sort;
              });
              onSort(columnIndex, ascending);
            }),
        DataColumn(
            label: Text("Storage ID"),
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
            label: Text("Life span"),
            numeric: false,
            onSort: (columnIndex, ascending) {
              setState(() {
                sort = !sort;
              });
              onSort(columnIndex, ascending);
            }),
        DataColumn(
            label: Text("Price"),
            numeric: false,
            onSort: (columnIndex, ascending) {
              setState(() {
                sort = !sort;
              });
              onSort(columnIndex, ascending);
            }),
        DataColumn(
            label: Text("Build"),
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
        DataColumn(
            label: Text("Description"),
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
                    Text(item.source),
                    onTap: () {
                      print('Selected ${item.source}');
                    },
                  ),
                  DataCell(
                    Text(item.inventoryID),
                    onTap: () {
                      print('Selected ${item.inventoryID}');
                    },
                  ),
                  DataCell(
                    Text(item.storageID),
                    onTap: () {
                      print('Selected ${item.storageID}');
                    },
                  ),
                  DataCell(
                    Text(item.quantity),
                    onTap: () {
                      print('Selected ${item.quantity}');
                    },
                  ),
                  DataCell(
                    Text(item.lifespan),
                    onTap: () {
                      print('Selected ${item.lifespan}');
                    },
                  ),
                  DataCell(
                    Text(item.price),
                    onTap: () {
                      print('Selected ${item.price}');
                    },
                  ),
                  DataCell(
                    Text(item.build),
                    onTap: () {
                      print('Selected ${item.build}');
                    },
                  ),
                  DataCell(
                    Text(item.status),
                    onTap: () {
                      print('Selected ${item.status}');
                    },
                  ),
                  DataCell(
                    Text(item.description),
                    onTap: () {
                      print('Selected ${item.description}');
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
                      color: Colors.indigo,
                      size: 30,
                    ),
                    label: Text('ITEM LIST',
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
              ],
            ),
          ),
          ScrollableWidget(child: dataBody()),
        ]),
      ),
    );
  }
}
