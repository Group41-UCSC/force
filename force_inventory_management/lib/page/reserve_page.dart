import 'package:force_inventory_management/data/requests.dart';
import 'package:force_inventory_management/model/request.dart';
import 'package:force_inventory_management/widget/scrollable_widget.dart';
import 'package:flutter/material.dart';
import 'package:force_inventory_management/utils.dart';

class ReservePage extends StatefulWidget {
  ReservePage() : super();

  final String title = "Data Table";

  @override
  ReservePageState createState() => ReservePageState();
}

class ReservePageState extends State<ReservePage> {
  late List<Request> requests;
  int? sortColumnIndex;
  bool isAscending = false;

  @override
  void initState() {
    super.initState();

    this.requests = List.of(allRequest);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: ScrollableWidget(child: buildDataTable()),
      );

  Widget buildDataTable() {
    final columns = ['Item Name', 'Item ID', 'User Name', 'Quantity', 'Status'];

    return DataTable(
      sortAscending: isAscending,
      sortColumnIndex: sortColumnIndex,
      columns: getColumns(columns),
      rows: getRows(requests),
    );
  }

  List<DataColumn> getColumns(List<String> columns) {
    return columns.map((String column) {
      return DataColumn(
        label: Text(column),
        onSort: onSort,
      );
    }).toList();
  }

  List<DataRow> getRows(List<Request> requests) =>
      requests.map((Request request) {
        final cells = [
          request.itemName,
          request.itemID,
          request.userName,
          request.quantity,
          request.status
        ];

        return DataRow(cells: getCells(cells));
      }).toList();
  List<DataCell> getCells(List<dynamic> cells) =>
      cells.map((data) => DataCell(Text('$data'))).toList();

  void onSort(int columnIndex, bool ascending) {
    if (columnIndex == 0) {
      requests.sort((request1, request2) => compareString(
          ascending, '${request1.itemName}', '${request2.itemName}'));
    } else if (columnIndex == 1) {
      requests.sort((request1, request2) =>
          compareString(ascending, '${request1.itemID}', '${request2.itemID}'));
    } else if (columnIndex == 2) {
      requests.sort((request1, request2) =>
          compareString(ascending, request1.userName, request2.userName));
    } else if (columnIndex == 3) {
      requests.sort((request1, request2) => compareString(
          ascending, '${request1.quantity}', '${request2.quantity}'));
    } else if (columnIndex == 4) {
      requests.sort((request1, request2) =>
          compareString(ascending, '${request1.status}', '${request2.status}'));
    }

    setState(() {
      this.sortColumnIndex = columnIndex;
      this.isAscending = ascending;
    });
  }

  int compareString(bool ascending, String value1, String value2) =>
      ascending ? value1.compareTo(value2) : value2.compareTo(value1);
}
