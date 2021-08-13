import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:royalscouts/app/core/models/instruction.dart';
import 'package:royalscouts/app/core/models/task.dart';
import 'package:royalscouts/app/core/services/instruction_service.dart';
import 'package:royalscouts/app/core/services/task_service.dart';
import 'package:royalscouts/app/core/services/user_service.dart';
import 'package:royalscouts/app/shared/configs/custom_color.dart';
import 'package:royalscouts/app/shared/widgets/animation/animation.dart';
import 'package:royalscouts/app/shared/widgets/elements/custom_card.dart';
import 'package:royalscouts/app/shared/widgets/styles/buttons.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InstructionsTab extends StatefulWidget {
  final bool editMode;
  final bool viewMode;
  final Task? editTaskData;

  const InstructionsTab({
    Key? key,
    this.editMode = false,
    this.viewMode = false,
    this.editTaskData,
  }) : super(key: key);

  @override
  _InstructionsTabState createState() => _InstructionsTabState();
}

class _InstructionsTabState extends State<InstructionsTab> {
  final List<TextEditingController> _controllers = [];
  final _insFormKey = GlobalKey<FormState>();
  Map<String, dynamic> task = Map();
  List<bool> isEmpty = [];

  // Todo: get the values from inventory
  List<bool> _isChecked = [false, false, false, false];
  List<String> _things = ["Chalk", "Stick", "Score Board", "Open Space"];

  @override
  void initState() {
    setEditModeData();
    getMainFormValues();
    super.initState();
  }

  setEditModeData() async {
    if (widget.editMode && widget.editTaskData!.id != 0) {
      List<Instruction> instructions = await InstructionService()
          .getInstructionsByTaskId(widget.editTaskData!.id);
      instructions.forEach((instruction) {
        _controllers.add(TextEditingController(text: instruction.content));
        isEmpty.add(false);
      });

      // set things needed
      List<String> checkedThings = widget.editTaskData!.thingsNeeded.split(",");

      checkedThings.asMap().forEach((index, element) {
        var elementIdx = _things.indexOf(element);

        if (elementIdx != -1) {
          _isChecked[elementIdx] = true;
        } else {
          _isChecked[elementIdx] = false;
        }
        setState(() {});
      });

      setState(() {});
    }
  }

  getMainFormValues() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (prefs.getString('task') != null) {
      String result = prefs.getString('task')!;
      task = jsonDecode(result) as Map<String, dynamic>;
    }
  }

  Widget getCard(int index) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CustomCard(
        title: 'Step ${index + 1}',
        height: 120,
        enableCloseButton: true,
        onClosed: () {
          _controllers.remove(_controllers[index]);
          setState(() {});
        },
        child: Container(
          margin: const EdgeInsets.fromLTRB(18.0, 25.0, 18.0, 8.0),
          color: isEmpty[index] ? Colors.white : Colors.blue[50],
          child: TextFormField(
            controller: _controllers[index],
            validator: (value) {
              if (value!.isEmpty) {
                setState(() {
                  isEmpty[index] = true;
                });
                return 'Please enter a step ${index + 1}';
              }
            },
            style: TextStyle(
              fontSize: 15.0,
            ),
            maxLines: 2,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(10.0),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.blue[50] ?? Colors.blue,
                ),
                borderRadius: BorderRadius.circular(5.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.blue[50] ?? Colors.blue,
                ),
                borderRadius: BorderRadius.circular(5.0),
              ),
              hintText: "Enter instruction for step ${index + 1}",
              fillColor: Colors.blue[50],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: IgnorePointer(
        ignoring: widget.viewMode,
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: BootstrapRow(
                  children: <BootstrapCol>[
                    BootstrapCol(
                      sizes: 'col-sm-12 col-md-8',
                      child: CustomCard(
                        title: 'Step by Step Instructions',
                        height: 130 * (_controllers.length + 1),
                        child: Padding(
                          padding: const EdgeInsets.all(25),
                          child: ListView(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 10.0, right: 5.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    if (!widget.viewMode)
                                      ElevatedButton(
                                        style: primaryButtonStyle,
                                        onPressed: () {
                                          _controllers
                                              .add(TextEditingController());
                                          isEmpty.add(false);
                                          setState(() {});
                                        },
                                        child: Text('Add a Step'),
                                      ),
                                  ],
                                ),
                              ),
                              Container(
                                height: 120 * (_controllers.length + 1),
                                child: Form(
                                  key: _insFormKey,
                                  child: ListView.builder(
                                      itemCount: _controllers.length,
                                      padding: const EdgeInsets.only(top: 10.0),
                                      itemBuilder: (context, index) {
                                        return getCard(index);
                                      }),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    BootstrapCol(
                      sizes: 'col-sm-12 col-md-4',
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          CustomCard(
                            title: 'Things Needed',
                            height: 260,
                            child: Padding(
                              padding: const EdgeInsets.all(25),
                              child: ListView.builder(
                                itemCount: _things.length,
                                padding: const EdgeInsets.only(top: 10.0),
                                itemBuilder: (context, index) {
                                  return CheckboxListTile(
                                    title: Text(_things[index]),
                                    activeColor: CustomColor.primary,
                                    controlAffinity:
                                        ListTileControlAffinity.leading,
                                    value: _isChecked[index],
                                    onChanged: (val) {
                                      setState(() {
                                        _isChecked[index] = val!;
                                      });
                                    },
                                  );
                                },
                              ),
                            ),
                          ),
                          if (!widget.viewMode)
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 80, vertical: 55.0),
                              child: ElevatedButton(
                                style: primaryButtonStyle,
                                onPressed: () async {
                                  List<String> instructions = [];

                                  for (TextEditingController controller
                                      in _controllers) {
                                    instructions.add(controller.text);
                                  }

                                  task['instructions'] = instructions;
                                  task['createdBy'] =
                                      UserService.currentUser.name;

                                  List<String> checkedList = [];

                                  for (var i = 0; i < _isChecked.length; i++) {
                                    bool item = _isChecked[i];
                                    if (item) {
                                      checkedList.add(_things[i]);
                                    }
                                  }

                                  task['thingsNeeded'] = checkedList.join(",");

                                  if (_controllers.length > 0 &&
                                      _insFormKey.currentState!.validate()) {
                                    if (widget.editMode) {
                                      await TaskService().updateTask(
                                          widget.editTaskData!.id, task);
                                    } else {
                                      await TaskService().addTask(task);
                                    }

                                    Navigator.pushNamedAndRemoveUntil(
                                      context,
                                      '/admin',
                                      (route) => false,
                                    );
                                  } else {
                                    Alert(
                                        context: context,
                                        type: AlertType.info,
                                        title: "Empty Alert",
                                        desc: "Please enter instructions",
                                        alertAnimation: fadeAlertAnimation,
                                        buttons: [
                                          DialogButton(
                                            child: Text(
                                              "OK",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20),
                                            ),
                                            onPressed: () =>
                                                Navigator.pop(context),
                                            color: CustomColor.primary,
                                          ),
                                        ]).show();
                                  }
                                },
                                child: Text(widget.editMode
                                    ? 'Update Programme'
                                    : 'Submit New Programme'),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
