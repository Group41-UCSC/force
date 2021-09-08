import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';
import 'package:royalscouts/app/modules/admin/task_module/task_report/report.dart';

import 'examples.dart';

class TaskReport extends StatefulWidget {
  const TaskReport({Key? key}) : super(key: key);

  @override
  _TaskReportState createState() => _TaskReportState();
}

class _TaskReportState extends State<TaskReport> {
  PrintingInfo? printingInfo;

  var _data = CustomData();
  var _hasData = false;
  var _pending = false;

  @override
  void initState() {
    super.initState();
    _init();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  Future<void> _init() async {
    final info = await Printing.info();

    setState(() {
      printingInfo = info;
    });
  }

  Future<void> _saveAsFile(
    BuildContext context,
    LayoutCallback build,
    PdfPageFormat pageFormat,
  ) async {
    final bytes = await build(pageFormat);

    final appDocDir = await getApplicationDocumentsDirectory();
    final appDocPath = appDocDir.path;
    final file = File(appDocPath + '/' + 'document.pdf');
    print('Save as file ${file.path} ...');
    await file.writeAsBytes(bytes);
    await OpenFile.open(file.path);
  }

  @override
  Widget build(BuildContext context) {
    final actions = <PdfPreviewAction>[
      if (!kIsWeb)
        PdfPreviewAction(
          icon: const Icon(Icons.save),
          onPressed: _saveAsFile,
        )
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter PDF Demo'),
      ),
      body: PdfPreview(
        maxPageWidth: 700,
        build: (format) => Example('REPORT', 'report.dart', generateReport).builder(format, _data),
        actions: actions,
      ),
    );
  }
}
