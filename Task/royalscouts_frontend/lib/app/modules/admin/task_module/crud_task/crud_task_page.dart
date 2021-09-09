import 'dart:html';

import 'package:flutter/material.dart';
import 'package:royalscouts/app/core/models/task.dart';
import 'package:royalscouts/app/shared/configs/custom_color.dart';

import 'instructions_tab.dart';
import 'main_tab.dart';

class CrudTaskPage extends StatefulWidget {
  const CrudTaskPage({Key? key}) : super(key: key);

  @override
  _CrudTaskPageState createState() => _CrudTaskPageState();
}

class _CrudTaskPageState extends State<CrudTaskPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late Task editTaskData;
  num editTaskId = 0;

  @override
  void initState() {
    _tabController = new TabController(vsync: this, length: 2);
    editTaskData = Task.setEmptyTask();
    super.initState();
  }

  bool isViewMode() {
    return window.location.href.contains("view-task");
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments;
    if (args != null) {
      editTaskData = args as Task;
    }

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(isViewMode()
              ? 'View Task'
              : editTaskData.id != 0
                  ? 'Edit Task'
                  : 'Add New Task'),
          elevation: 1,
        ),
        backgroundColor: CustomColor.background,
        body: Column(
          children: [
            Container(
              height: 50,
              child: AppBar(
                bottom: TabBar(
                  controller: _tabController,
                  tabs: [
                    Tab(text: 'Main'),
                    Tab(
                      text: 'Instructions',
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  MainTab(
                    viewMode: isViewMode(),
                    editMode: editTaskData.id != 0,
                    editTaskData: editTaskData,
                    callback: () =>
                        _tabController.animateTo((_tabController.index + 1)),
                  ),
                  InstructionsTab(
                    viewMode: isViewMode(),
                    editMode: editTaskData.id != 0,
                    editTaskData: editTaskData,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
