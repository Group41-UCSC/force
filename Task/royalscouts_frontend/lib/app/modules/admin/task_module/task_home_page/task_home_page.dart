import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_web_data_table/web_data_table.dart';
import 'package:royalscouts/app/core/models/task.dart';
import 'package:royalscouts/app/core/services/task_service.dart';
import 'package:royalscouts/app/modules/admin/task_module/task_home_page/widgets/table_view.dart';
import 'package:royalscouts/app/shared/configs/custom_color.dart';
import 'package:royalscouts/app/shared/configs/dropdown_data.dart';
import 'package:royalscouts/app/shared/widgets/elements/dropdown_filter.dart';
import 'package:royalscouts/app/shared/widgets/styles/buttons.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class TaskHomePage extends StatefulWidget {
  const TaskHomePage({Key? key}) : super(key: key);

  @override
  _TaskHomePageState createState() => _TaskHomePageState();
}

class _TaskHomePageState extends State<TaskHomePage> {
  List<Map<String, dynamic>> data = [];

  final _pTypeFilterController = TextEditingController();
  final _statusFilterController = TextEditingController();

  String pTypeFilter = programmeTypes.first;
  String statusFilter = statusTypes.first;

  @override
  void initState() {
    getTasks();
    super.initState();
  }

  getTasks() async {
    data.clear();
    List<Task> tasks = await TaskService().getTasks();
    tasks.forEach((task) {
      data.add(task.values);
    });
    setState(() {});
  }

  List<WebDataColumn> columns = [
    WebDataColumn(
      name: 'id',
      label: const Text('Id'),
      dataCell: (value) => DataCell(Text('$value')),
    ),
    WebDataColumn(
      name: 'title',
      label: const Text('Title'),
      dataCell: (value) => DataCell(Text('$value')),
    ),
    WebDataColumn(
      name: 'status',
      label: const Text('Status'),
      dataCell: (value) => DataCell(Text('$value')),
    ),
    WebDataColumn(
      name: 'programmeType',
      label: const Text('Task Type'),
      dataCell: (value) => DataCell(Text('$value')),
    ),
    WebDataColumn(
      name: 'description',
      label: const Text('Description'),
      dataCell: (value) => DataCell(Text('$value')),
    ),
    WebDataColumn(
      name: 'spice',
      label: const Text('Spice'),
      dataCell: (value) => DataCell(Text('$value')),
    ),
    WebDataColumn(
      name: 'location',
      label: const Text('Location'),
      dataCell: (value) => DataCell(Text('$value')),
      sortable: false,
    ),
    WebDataColumn(
      name: 'score',
      label: const Text('Experience Point'),
      dataCell: (value) => DataCell(Text('$value')),
      sortable: false,
    ),
  ];

  List<String> getFilter() {
    String programmeValue = programmeTypes.first;
    String statusValue = statusTypes.first;

    if (programmeValue == pTypeFilter && statusValue == statusFilter) {
      return [];
    } else if (programmeValue != pTypeFilter && statusValue == statusFilter) {
      return [pTypeFilter];
    } else if (programmeValue == pTypeFilter && statusValue != statusFilter) {
      return [statusFilter];
    } else {
      return [pTypeFilter, statusFilter];
    }
  }

  getReportData() {
    List<List<dynamic>> dataTable = [];

    data.forEach((element) => {
          dataTable.add([
            element['id'],
            element['createdBy'],
            element['programmeType'],
            element['difficulty'],
            element['score']
          ])
        });

    return dataTable;
  }

  Future<Uint8List> generateReport(PdfPageFormat pageFormat) async {
    const tableHeaders = [
      'Task Id',
      'Created By',
      'Programme Type',
      'Difficulty',
      'Score'
    ];

    // Create a PDF document.
    final document = pw.Document();

    // Data table
    final table = pw.Table.fromTextArray(
      border: null,
      headers: tableHeaders,
      data: List<List<dynamic>>.generate(
        getReportData().length,
        (index) => <dynamic>[
          getReportData()[index][0],
          getReportData()[index][1],
          getReportData()[index][2],
          getReportData()[index][3],
          getReportData()[index][4],
        ],
      ),
      headerStyle: pw.TextStyle(
        color: PdfColors.white,
        fontWeight: pw.FontWeight.bold,
      ),
      headerDecoration: pw.BoxDecoration(
        color: PdfColors.black,
      ),
      rowDecoration: pw.BoxDecoration(
        border: pw.Border(
          bottom: pw.BorderSide(
            color: PdfColors.black,
            width: .5,
          ),
        ),
      ),
      cellAlignment: pw.Alignment.center,
      cellAlignments: {0: pw.Alignment.center},
    );

    // Add page to the PDF
    document.addPage(
      pw.Page(
        pageFormat: pageFormat,
        theme: pw.ThemeData.withFont(
          base: await PdfGoogleFonts.openSansRegular(),
          bold: await PdfGoogleFonts.openSansBold(),
        ),
        build: (context) {
          return pw.Column(
            children: [
              pw.Text(
                'Task Report',
                style: pw.TextStyle(
                  color: PdfColors.black,
                  fontSize: 30,
                ),
              ),
              pw.Divider(thickness: 4),
              pw.SizedBox(height: 10),
              table,
            ],
          );
        },
      ),
    );

    // save PDF file
    return document.save();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              child: Text(
                "Task Home",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              child: ElevatedButton(
                style: primaryButtonStyle,
                child: Text(
                  'Generate Report',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  Printing.layoutPdf(
                    // [onLayout] will be called multiple times
                    // when the user changes the printer or printer settings
                    onLayout: (PdfPageFormat format) {
                      // Any valid Pdf document can be returned here as a list of int
                      return generateReport(format);
                    },
                  );
                },
              ),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: TableView(
            data: data,
            filterTexts: getFilter(),
            onDelete: getTasks,
            columns: columns,
            actions: [
              Padding(
                padding: const EdgeInsets.only(top: 25.0),
                child: Text(
                  "Filters: ",
                  textAlign: TextAlign.left,
                  style: TextStyle(color: CustomColor.primary, fontSize: 14),
                ),
              ),
              DropdownFilter(
                title: 'Select a task type',
                filters: programmeTypes,
                controller: _pTypeFilterController,
                callback: () {
                  setState(() {
                    pTypeFilter = _pTypeFilterController.text;
                  });
                },
              ),
              DropdownFilter(
                title: 'Select a status',
                filters: statusTypes,
                controller: _statusFilterController,
                callback: () {
                  setState(() {
                    statusFilter = _statusFilterController.text;
                  });
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
