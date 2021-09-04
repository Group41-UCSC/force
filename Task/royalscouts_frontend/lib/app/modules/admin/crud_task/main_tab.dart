import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';
import 'package:royalscouts/app/core/models/task.dart';
import 'package:royalscouts/app/modules/admin/crud_task/widgets/duration_field.dart';
import 'package:royalscouts/app/modules/admin/crud_task/widgets/origin_radio_field.dart';
import 'package:royalscouts/app/shared/widgets/elements/custom_card.dart';
import 'package:royalscouts/app/shared/widgets/elements/dropdown_field.dart';
import 'package:royalscouts/app/shared/widgets/elements/number_input_field.dart';
import 'package:royalscouts/app/shared/widgets/elements/text_input_field.dart';
import 'package:royalscouts/app/shared/configs/custom_color.dart';
import 'package:royalscouts/app/shared/widgets/styles/buttons.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainTab extends StatefulWidget {
  final bool editMode;
  final bool viewMode;
  final Task? editTaskData;
  final VoidCallback callback;

  const MainTab({
    Key? key,
    required this.callback,
    this.editMode = false,
    this.viewMode = false,
    this.editTaskData,
  }) : super(key: key);

  @override
  _MainTabState createState() => _MainTabState();
}

class _MainTabState extends State<MainTab> {
  bool isScoreEmpty = false;
  late Image pickedImage;
  final _desFormKey = GlobalKey<FormState>();
  final _empFormKey = GlobalKey<FormState>();
  final _scoreFormKey = GlobalKey<FormState>();

  final _titleController = TextEditingController();
  final _originController = TextEditingController();
  final _opcController = TextEditingController();
  final _npcController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _pTypeController = TextEditingController();
  final _spiceController = TextEditingController();
  final _bonusController = TextEditingController();
  final _supervisionController = TextEditingController();
  final _scoreController = TextEditingController();
  final _difficultyController = TextEditingController();
  final _participationController = TextEditingController();
  final _locationController = TextEditingController();

  final _durationDaysController = TextEditingController();
  final _durationHoursController = TextEditingController();
  final _durationMinsController = TextEditingController();

  @override
  void initState() {
    setEditModeData();
    super.initState();
  }

  setEditModeData() {
    if (widget.editMode) {
      _titleController.text = widget.editTaskData!.title;
      _originController.text = widget.editTaskData!.origin;
      _opcController.text = widget.editTaskData!.opc;
      _npcController.text = widget.editTaskData!.npc;
      _descriptionController.text = widget.editTaskData!.description;
      _pTypeController.text = widget.editTaskData!.programmeType;
      _spiceController.text = widget.editTaskData!.spice;
      _bonusController.text = widget.editTaskData!.bonus.toString();
      _difficultyController.text = widget.editTaskData!.difficulty;
      _supervisionController.text = widget.editTaskData!.supervision;
      _participationController.text = widget.editTaskData!.participation;
      _scoreController.text = widget.editTaskData!.score.toString();
      _locationController.text = widget.editTaskData!.location;
      _durationDaysController.text =
          widget.editTaskData!.durationDays.toString();
      _durationHoursController.text =
          widget.editTaskData!.durationHours.toString();
      _durationMinsController.text =
          widget.editTaskData!.durationMins.toString();
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _originController.dispose();
    _opcController.dispose();
    _npcController.dispose();
    _descriptionController.dispose();
    _pTypeController.dispose();
    _spiceController.dispose();
    _bonusController.dispose();
    _difficultyController.dispose();
    _supervisionController.dispose();
    _participationController.dispose();
    _scoreController.dispose();
    _locationController.dispose();
    _durationDaysController.dispose();
    _durationHoursController.dispose();
    _durationMinsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IgnorePointer(
            ignoring: widget.viewMode,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: BootstrapRow(
                children: <BootstrapCol>[
                  BootstrapCol(
                    sizes: 'col-sm-12 col-md-6',
                    child: CustomCard(
                      title: 'Description',
                      height: 650,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(25, 25, 25, 5),
                        child: Form(
                          key: _desFormKey,
                          child: Column(
                            children: <Widget>[
                              TextInputField(
                                label: "Title",
                                controller: _titleController,
                              ),
                              OriginRadioField(
                                controller: _originController,
                                editMode: widget.editMode,
                              ),
                              TextInputField(
                                label: "Original Programme Code",
                                controller: _opcController,
                              ),
                              TextInputField(
                                label: "New Programme Code",
                                controller: _npcController,
                              ),
                              TextInputField(
                                label: "Brief Description",
                                maxLines: 4,
                                controller: _descriptionController,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  BootstrapCol(
                    sizes: 'col-sm-12 col-md-6',
                    child: CustomCard(
                      title: 'Experience Merit Points',
                      height: isScoreEmpty ? 675 : 650,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(25, 25, 25, 5),
                        child: Form(
                          key: _empFormKey,
                          child: Column(
                            children: <Widget>[
                              DropdownField(
                                label: "Programme Type",
                                contents: ["Fun", "Adventure", "Art", "FirstAid"],
                                controller: _pTypeController,
                                editMode: widget.editMode,
                              ),
                              DropdownField(
                                label: "Spice",
                                contents: [
                                  "Spiritual",
                                  "Physical",
                                  "Intel",
                                  "Cult"
                                ],
                                controller: _spiceController,
                                editMode: widget.editMode,
                              ),
                              DurationField(
                                dayController: _durationDaysController,
                                hourController: _durationHoursController,
                                minController: _durationMinsController,
                              ),
                              DropdownField(
                                label: "Participation",
                                contents: [
                                  "Individual",
                                  "Team",
                                  "Group",
                                ],
                                controller: _participationController,
                                editMode: widget.editMode,
                              ),
                              DropdownField(
                                label: "Location",
                                contents: [
                                  "Indoor",
                                  "Outdoor",
                                  "Both",
                                  "Jungle",
                                  "Urban"
                                ],
                                controller: _locationController,
                                editMode: widget.editMode,
                              ),
                              NumberInputField(
                                label: "Bonus*",
                                content: "0",
                                controller: _bonusController,
                              ),
                              DropdownField(
                                label: "Difficulty",
                                contents: ["Easy", "Hard"],
                                controller: _difficultyController,
                                editMode: widget.editMode,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8.0),
                                      child: Text(
                                        'Experience Merit Calculate Score',
                                        style: TextStyle(
                                          fontSize: 16.5,
                                          fontWeight: FontWeight.bold,
                                          color: CustomColor.primary,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 120,
                                      color: isScoreEmpty
                                          ? Colors.white
                                          : Colors.blue[50],
                                      child: Form(
                                        key: _scoreFormKey,
                                        child: TextFormField(
                                          controller: _scoreController,
                                          keyboardType: TextInputType.number,
                                          inputFormatters: [
                                            FilteringTextInputFormatter.digitsOnly
                                          ],
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              setState(() {
                                                isScoreEmpty = true;
                                              });
                                              return 'Enter a score';
                                            }
                                          },
                                          style: TextStyle(
                                            fontSize: 15.0,
                                          ),
                                          decoration: InputDecoration(
                                            contentPadding: EdgeInsets.all(10.0),
                                            border: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Colors.blue[50] ??
                                                    Colors.blue,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(5.0),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Colors.blue[50] ??
                                                    Colors.blue,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(5.0),
                                            ),
                                            hintText: "0",
                                            fillColor: Colors.blue[50],
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  BootstrapCol(
                    sizes: 'col-sm-12 col-md-6',
                    child: Padding(
                      padding: const EdgeInsets.only(top: 18.0),
                      child: CustomCard(
                        title: 'Restrictions',
                        height: 150,
                        child: Padding(
                          padding: const EdgeInsets.all(25),
                          child: Column(
                            children: <Widget>[
                              DropdownField(
                                label: "Supervision",
                                contents: ["PL", "Ins", "ASL", "Expert"],
                                controller: _supervisionController,
                                editMode: widget.editMode,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0, left: 50.0, bottom: 20.0),
            child: ElevatedButton(
              style: primaryButtonStyle,
              onPressed: () async {
                if (_desFormKey.currentState!.validate() &&
                    _empFormKey.currentState!.validate() &&
                    _scoreFormKey.currentState!.validate()) {
                  setState(() {
                    isScoreEmpty = false;
                  });

                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();

                  Map<String, dynamic> task = {
                    'title': _titleController.text,
                    'status': 'Pending',
                    'origin': _originController.text,
                    'opc': _opcController.text,
                    'npc': _npcController.text,
                    'description': _descriptionController.text,
                    'programmeType': _pTypeController.text,
                    'spice': _spiceController.text,
                    'durationDays': _durationDaysController.text,
                    'durationHours': _durationHoursController.text,
                    'durationMins': _durationMinsController.text,
                    'participation': _participationController.text,
                    'location': _locationController.text,
                    'bonus': _bonusController.text,
                    'score': _scoreController.text,
                    'supervision': _supervisionController.text,
                    'difficulty': _difficultyController.text
                  };

                  bool result = await prefs.setString('task', jsonEncode(task));

                  if (result) {
                    widget.callback();
                  } else {
                    print('Error');
                  }
                }
              },
              child: Text('Next > Instructions'),
            ),
          )
        ],
      ),
    );
  }
}
