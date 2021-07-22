import 'package:force_inventory_management/data/items.dart';
import 'package:force_inventory_management/model/item.dart';
import 'package:force_inventory_management/utils.dart';
import 'package:force_inventory_management/widget/scrollable_widget.dart';
import 'package:force_inventory_management/widget/text_dialog_widget.dart';
import 'package:flutter/material.dart';

class EditablePage extends StatefulWidget {
  @override
  _EditablePageState createState() => _EditablePageState();
}

class _EditablePageState extends State<EditablePage> {
  late List<Item> items;
  int? sortColumnIndex;
  bool isAscending = false;

  @override
  void initState() {
    super.initState();

    this.items = List.of(allItems);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: ScrollableWidget(child: buildDataTable()),
      );

  Widget buildDataTable() {
    final columns = ['Storage ID', 'Item ID', 'Item Name', 'Quantity'];

    return DataTable(
      sortAscending: isAscending,
      sortColumnIndex: sortColumnIndex,
      columns: getColumns(columns),
      rows: getRows(items),
    );
  }

  List<DataColumn> getColumns(List<String> columns) {
    return columns.map((String column) {
      final isQuantity = column == columns[3];

      return DataColumn(
        label: Text(column),
        onSort: onSort,
        numeric: isQuantity,
      );
    }).toList();
  }

  List<DataRow> getRows(List<Item> items) => items.map((Item item) {
        final cells = [
          item.storageID,
          item.itemID,
          item.itemName,
          item.quantity
        ];

        return DataRow(
          cells: Utils.modelBuilder(cells, (index, cell) {
            final showEditIcon = index == 0;

            return DataCell(
              Text('$cell'),
              showEditIcon: showEditIcon,
              onTap: () {
                switch (index) {
                  case 0:
                    editItemName(item);
                    break;
                }
              },
            );
          }),
        );
      }).toList();

  Future editItemName(Item editItem) async {
    final itemName = await showTextDialog(
      context,
      title: 'Change Item Name',
      value: editItem.itemName,
    );

    setState(() => items = items.map((item) {
          final isEditedItem = item == editItem;

          return isEditedItem ? item.copy(itemName: itemName) : item;
        }).toList());
  }

  void onSort(int columnIndex, bool ascending) {
    if (columnIndex == 0) {
      items.sort((item1, item2) =>
          compareString(ascending, '${item1.storageID}', '${item2.storageID}'));
    } else if (columnIndex == 1) {
      items.sort((item1, item2) =>
          compareString(ascending, '${item1.itemID}', '${item2.itemID}'));
    } else if (columnIndex == 2) {
      items.sort((item1, item2) =>
          compareString(ascending, item1.itemName, item2.itemName));
    } else if (columnIndex == 3) {
      items.sort((item1, item2) =>
          compareString(ascending, '${item1.quantity}', '${item2.quantity}'));
    }

    setState(() {
      this.sortColumnIndex = columnIndex;
      this.isAscending = ascending;
    });
  }

  int compareString(bool ascending, String value1, String value2) =>
      ascending ? value1.compareTo(value2) : value2.compareTo(value1);
}
