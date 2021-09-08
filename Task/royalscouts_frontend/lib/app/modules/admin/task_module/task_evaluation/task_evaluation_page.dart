import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:royalscouts/app/core/models/evaluation.dart';
import 'package:royalscouts/app/core/models/task.dart';
import 'package:royalscouts/app/core/services/evaluation_service.dart';
import 'package:royalscouts/app/core/services/task_service.dart';
import 'package:royalscouts/app/core/services/user_service.dart';
import 'package:royalscouts/app/shared/configs/custom_color.dart';
import 'package:royalscouts/app/shared/widgets/elements/custom_card.dart';
import 'package:royalscouts/app/shared/widgets/elements/custom_dialog.dart';
import 'package:royalscouts/app/shared/widgets/elements/date_input_field.dart';
import 'package:royalscouts/app/shared/widgets/elements/dropdown_field.dart';
import 'package:royalscouts/app/shared/widgets/elements/label_field.dart';
import 'package:royalscouts/app/shared/widgets/elements/text_input_field.dart';
import 'package:royalscouts/app/shared/widgets/styles/buttons.dart';

class TaskEvaluationPage extends StatefulWidget {
  const TaskEvaluationPage({Key? key}) : super(key: key);

  @override
  _TaskEvaluationPageState createState() => _TaskEvaluationPageState();
}

class _TaskEvaluationPageState extends State<TaskEvaluationPage> {
  List<bool> isEmpty = [];
  List<String> taskIds = [];
  final _evaluationFormKey = GlobalKey<FormState>();

  List<Evaluation> evaluations = [];

  final _titleController = TextEditingController();
  final _taskIdController = TextEditingController();
  final _versionController = TextEditingController();
  final _startDateController = TextEditingController();
  final _endDateController = TextEditingController();

  late Timer _timer;
  bool showLoader = true;

  @override
  void initState() {
    _timer = Timer(const Duration(seconds: 1), () {
      getEvaluations();
      Future.delayed(
        const Duration(seconds: 1),
        () => setState(() => showLoader = false),
      );
    });
    getTasks();
    super.initState();
  }

  getTasks() async {
    List<Task> tasks = await TaskService().getTasks();
    tasks.forEach((task) => taskIds.add(task.id.toString()));
  }

  @override
  void dispose() {
    _titleController.dispose();
    _taskIdController.dispose();
    _versionController.dispose();
    _startDateController.dispose();
    _endDateController.dispose();
    super.dispose();
  }

  final RoundedLoadingButtonController _btnController1 =
      RoundedLoadingButtonController();

  final RoundedLoadingButtonController _btnController2 =
      RoundedLoadingButtonController();

  void _onDelete(int index, RoundedLoadingButtonController controller) async {
    EvaluationService().deleteEvaluation(evaluations[index].id);
    Timer(Duration(seconds: 2), () {
      controller.success();
      updateForm();
      Navigator.pop(context);
    });
  }

  Widget getCard(int index) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CustomCard(
        title: 'Evaluation ${evaluations[index].id}',
        height: 550,
        enableCloseButton: true,
        onClosed: () {
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
                  child: Text('Yes', style: TextStyle(color: Colors.white)),
                  controller: _btnController1,
                  onPressed: () => _onDelete(index, _btnController1),
                ),
                onPressed: () {},
                color: Colors.transparent,
              ),
              DialogButton(
                child: RoundedLoadingButton(
                  color: CustomColor.accent,
                  successColor: CustomColor.accent,
                  width: 100,
                  child: Text('No', style: TextStyle(color: Colors.white)),
                  controller: _btnController2,
                  onPressed: () => Navigator.pop(context),
                ),
                onPressed: () {},
                color: Colors.transparent,
              ),
            ],
          ).show();
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 25.0),
          child: Column(
            children: [
              LabelField(
                labelText: "Title",
                value: evaluations[index].title,
              ),
              LabelField(
                labelText: "Task Id",
                value: evaluations[index].taskId.toString(),
              ),
              LabelField(
                labelText: "Start Date",
                value: evaluations[index].startDate,
              ),
              LabelField(
                labelText: "End Date",
                value: evaluations[index].endDate,
              ),
              LabelField(
                labelText: "Version",
                value: "v.${evaluations[index].version.toStringAsFixed(1)}",
              )
            ],
          ),
        ),
      ),
    );
  }

  getEvaluations() async {
    var newEvaluations = await EvaluationService().getEvaluations();
    setState(() => evaluations = newEvaluations);
  }

  @override
  Widget build(BuildContext context) {
    // final args = ModalRoute.of(context)!.settings.arguments;
    // if (args != null) {
    //   editTaskData = args as Task;
    // }

    return ListView(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              child: Text(
                "Task Evaluation",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              child: ElevatedButton(
                style: primaryButtonStyle,
                child: Text(
                  'Add Evaluation',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return CustomDialog(
                          child: CustomCard(
                            title: 'Add Evaluation',
                            height: 480,
                            enableCloseButton: true,
                            onClosed: () {
                              Navigator.pop(context);
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(25),
                              child: Form(
                                key: _evaluationFormKey,
                                child: ListView(
                                  shrinkWrap: true,
                                  children: <Widget>[
                                    TextInputField(
                                      label: "Title",
                                      controller: _titleController,
                                    ),
                                    DropdownField(
                                      label: "Task Id",
                                      contents: taskIds,
                                      controller: _taskIdController,
                                    ),
                                    DateInputField(
                                      label: "Start Date",
                                      controller: _startDateController,
                                    ),
                                    DateInputField(
                                      label: "End Date",
                                      controller: _endDateController,
                                    ),
                                    TextInputField(
                                      label: "Version",
                                      controller: _versionController,
                                      content: "v1.0",
                                      disable: true,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 30.0, left: 50, right: 50),
                                      child: ElevatedButton(
                                        style: primaryButtonStyle,
                                        onPressed: () async {
                                          if (_evaluationFormKey.currentState!
                                              .validate()) {
                                            Map<String, dynamic> evaluation = {
                                              'taskId': _taskIdController.text,
                                              'title': _titleController.text,
                                              'startDate':
                                                  _startDateController.text,
                                              'endDate':
                                                  _endDateController.text,
                                              'createdBy':
                                                  UserService.currentUser.name,
                                            };

                                            await EvaluationService()
                                                .addEvaluation(evaluation);
                                            Navigator.pop(context);
                                            updateForm();
                                          }
                                        },
                                        child: Text('Submit New Evaluation'),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      });
                },
              ),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: evaluations.length == 0 && showLoader
              ? Center(
                  child: Container(
                    color: Colors.transparent,
                    width: 250.0,
                    height: 250.0,
                    child: SpinKitRing(
                      color: CustomColor.primary,
                      size: 100.0,
                    ),
                  ),
                )
              : evaluations.length == 0 && !showLoader
                  ? Center(
                      child: Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Text(
                          'Evaluations not Found',
                          style: TextStyle(
                            fontSize: 20,
                            color: CustomColor.primary,
                          ),
                        ),
                      ),
                    )
                  : GridView.builder(
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 400,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20,
                        childAspectRatio: 0.8
                      ),
                      itemCount: evaluations.length,
                      itemBuilder: (BuildContext ctx, index) {
                        return getCard(index);
                      },
                    ),
        ),
      ],
    );
  }

  updateForm() {
    _titleController.clear();
    _taskIdController.clear();
    _versionController.clear();
    _startDateController.clear();
    _endDateController.clear();
    getEvaluations();
    setState(() {});
  }
}
