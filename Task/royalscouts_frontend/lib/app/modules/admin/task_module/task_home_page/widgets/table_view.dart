import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_web_data_table/web_data_table.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:royalscouts/app/core/models/task.dart';
import 'package:royalscouts/app/core/models/user.dart';
import 'package:royalscouts/app/core/services/task_service.dart';
import 'package:royalscouts/app/core/services/user_service.dart';
import 'package:royalscouts/app/shared/configs/custom_color.dart';
import 'package:royalscouts/app/shared/configs/routes.dart';
import 'package:royalscouts/app/shared/widgets/styles/buttons.dart';

class TableView extends StatefulWidget {
  final List<Map<String, dynamic>> data;
  final List<WebDataColumn> columns;
  final List<Widget> actions;
  final List<String>? filterTexts;
  final VoidCallback? onDelete;

  const TableView({
    Key? key,
    required this.data,
    required this.actions,
    required this.columns,
    this.filterTexts,
    this.onDelete,
  }) : super(key: key);

  @override
  _TableViewState createState() => _TableViewState();
}

class _TableViewState extends State<TableView> {
  late String _sortColumnName;
  late bool _sortAscending;
  List<String> _selectedRowKeys = [];
  int _rowsPerPage = 10;
  late Timer _timer;
  bool showLoader = true;

  late Task editTaskObj;

  get isLeader => UserService.currentUser.role == Role.Leader;

  final RoundedLoadingButtonController _btnController1 =
      RoundedLoadingButtonController();

  final RoundedLoadingButtonController _btnController2 =
      RoundedLoadingButtonController();

  @override
  void initState() {
    super.initState();
    _sortColumnName = 'browser';
    _sortAscending = false;
    editTaskObj = Task.setEmptyTask();
    _timer = Timer(
      const Duration(seconds: 3),
      () => setState(() => showLoader = false),
    );
  }

  Widget _actionButtons({
    required String title,
    required Function onClicked,
    required ButtonStyle style,
    bool showButton = false,
  }) {
    return _selectedRowKeys.isNotEmpty &&
            _selectedRowKeys.length == 1 &&
            !showButton
        ? Padding(
            padding: const EdgeInsets.only(bottom: 15.0, right: 8.0, top: 10.0),
            child: SizedBox(
              height: 35,
              child: ElevatedButton(
                style: style,
                child: Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  onClicked();
                  setState(() {
                    _selectedRowKeys.clear();
                  });
                },
              ),
            ),
          )
        : !_selectedRowKeys.isNotEmpty && showButton
            ? Padding(
                padding:
                    const EdgeInsets.only(bottom: 15.0, right: 8.0, top: 10.0),
                child: SizedBox(
                  height: 35,
                  child: ElevatedButton(
                    style: style,
                    child: Text(
                      title,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      onClicked();
                      setState(() {
                        _selectedRowKeys.clear();
                      });
                    },
                  ),
                ),
              )
            : SizedBox();
  }

  void _onDelete(RoundedLoadingButtonController controller) async {
    await TaskService().deleteTask(editTaskObj.id);
    Timer(Duration(seconds: 1), () {
      controller.success();
      widget.onDelete!();
      setState(() {});
      Navigator.popAndPushNamed(
        context,
        '/admin',
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: widget.data.length == 0 && showLoader
          ? Container(
              color: Colors.transparent,
              width: 300.0,
              height: 300.0,
              child: SpinKitRing(
                color: CustomColor.primary,
                size: 100.0,
              ),
            )
          : widget.data.length == 0 && !showLoader
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Tasks not Found',
                      style: TextStyle(
                        fontSize: 20,
                        color: CustomColor.primary,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(12.0, 18.0, 8.0, 8.0),
                      child: _actionButtons(
                        title: 'Add New Task',
                        onClicked: () => Navigator.pushNamed(
                          context,
                          Routes.addTask,
                        ),
                        showButton: true,
                        style: primaryButtonStyle,
                      ),
                    ),
                  ],
                )
              : WebDataTable(
                header: ListView(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  children: [
                    if (widget.actions.length > 0) ...widget.actions
                  ],
                ),
                actions: [
                  _actionButtons(
                    title: 'Add New Task',
                    onClicked: () => Navigator.pushNamed(
                      context,
                      Routes.addTask,
                    ),
                    showButton: true,
                    style: primaryButtonStyle,
                  ),
                  if ((isLeader ||
                          editTaskObj.createdBy ==
                              UserService.currentUser.name))
                    _actionButtons(
                      title: 'Edit Task',
                      onClicked: () => Navigator.pushNamed(
                        context,
                        Routes.editTask,
                        arguments: editTaskObj,
                      ),
                      style: primaryButtonStyle,
                    ),

                    _actionButtons(
                      title: 'View Task',
                      onClicked: () => Navigator.pushNamed(
                        context,
                        Routes.viewTask,
                        arguments: editTaskObj,
                      ),
                      style: primaryButtonStyle,
                    ),
                  if (isLeader && editTaskObj.status == 'Active')
                    _actionButtons(
                      title: 'Add Review',
                      onClicked: () => Navigator.pushNamed(
                        context,
                        Routes.taskReview,
                        arguments: editTaskObj,
                      ),
                      style: primaryButtonStyle,
                    ),
                  _actionButtons(
                    title: 'Provide Feedback',
                    onClicked: () => Navigator.pushNamed(
                      context,
                      Routes.taskFeedback,
                      arguments: editTaskObj,
                    ),
                    style: primaryButtonStyle,
                  ),
                  if (isLeader && editTaskObj.status == 'Pending' ||
                      editTaskObj.status == 'Inactive')
                    _actionButtons(
                      title: 'Approve',
                      onClicked: () async {
                        await TaskService().updateStatus(editTaskObj.id, {
                          'status': 'Active',
                          'approvedBy': UserService.currentUser.name
                        });
                        Navigator.popAndPushNamed(
                          context,
                          Routes.taskHome,
                        );
                      },
                      style: blackButtonStyle,
                    ),
                  if (isLeader && editTaskObj.status == 'Active')
                    _actionButtons(
                      title: 'Refuse',
                      onClicked: () async {
                        await TaskService().updateStatus(editTaskObj.id, {
                          'status': 'Inactive',
                          'approvedBy': UserService.currentUser.name
                        });
                      },
                      style: blackButtonStyle,
                    ),
                  if (isLeader)
                    _actionButtons(
                      title: 'Delete',
                      onClicked: () async {
                        Alert(
                          context: context,
                          type: AlertType.warning,
                          title: "Delete Alert",
                          desc: "Are you sure?",
                          buttons: [
                            DialogButton(
                              child: RoundedLoadingButton(
                                color: CustomColor.primary,
                                successColor: CustomColor.primary,
                                width: 100,
                                child: Text('Yes',
                                    style: TextStyle(color: Colors.white)),
                                controller: _btnController1,
                                onPressed: () => _onDelete(_btnController1),
                              ),
                              onPressed: () {},
                              color: Colors.transparent,
                            ),
                            DialogButton(
                              child: RoundedLoadingButton(
                                color: CustomColor.accent,
                                successColor: CustomColor.accent,
                                width: 100,
                                child: Text('No',
                                    style: TextStyle(color: Colors.white)),
                                controller: _btnController2,
                                onPressed: () => Navigator.pop(context),
                              ),
                              onPressed: () {},
                              color: Colors.transparent,
                            ),
                          ],
                        ).show();
                      },
                      style: redButtonStyle,
                    ),
                ],
                source: WebDataTableSource(
                  sortColumnName: _sortColumnName,
                  sortAscending: _sortAscending,
                  filterTexts: widget.filterTexts,
                  columns: widget.columns,
                  rows: widget.data,
                  selectedRowKeys: _selectedRowKeys,
                  onTapRow: (rows, index) {
                    setState(() {
                      editTaskObj = Task.fromJson(rows[index]);
                    });
                  },
                  onSelectRows: (keys) {
                    setState(() {
                      _selectedRowKeys = keys;
                    });
                  },
                  primaryKeyName: 'id',
                ),
                horizontalMargin: 30,
                onRowsPerPageChanged: (rowsPerPage) {
                  setState(() {
                    if (rowsPerPage != null) {
                      _rowsPerPage = rowsPerPage;
                    }
                  });
                },
                rowsPerPage: _rowsPerPage,
              ),
    );
  }
}
