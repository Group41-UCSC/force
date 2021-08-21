import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:royalscouts/app/core/models/feedback.dart';
import 'package:royalscouts/app/core/models/task.dart';
import 'package:royalscouts/app/core/models/user.dart';
import 'package:royalscouts/app/core/services/feedback_service.dart';
import 'package:royalscouts/app/core/services/user_service.dart';
import 'package:royalscouts/app/shared/configs/custom_color.dart';
import 'package:royalscouts/app/shared/widgets/elements/custom_card.dart';
import 'package:royalscouts/app/shared/widgets/elements/label_field.dart';
import 'package:royalscouts/app/shared/widgets/elements/rating_field.dart';
import 'package:royalscouts/app/shared/widgets/elements/text_input_field.dart';
import 'package:royalscouts/app/shared/widgets/styles/buttons.dart';

class TaskFeedbackPage extends StatefulWidget {
  const TaskFeedbackPage({Key? key}) : super(key: key);

  @override
  _TaskFeedbackPageState createState() => _TaskFeedbackPageState();
}

class _TaskFeedbackPageState extends State<TaskFeedbackPage> {
  Map<String, dynamic> task = Map();
  final _feedbackFormKey = GlobalKey<FormState>();

  late Task editTaskData;

  List<TaskFeedback> feedbacks = [];

  final _contentController = TextEditingController();
  final _ratingController = TextEditingController();

  late Timer _timer;
  bool showLoader = true;

  get isLeader => UserService.currentUser.role == Role.Leader;

  @override
  void initState() {
    editTaskData = Task.setEmptyTask();
    _ratingController.text = "3";
    _timer = Timer(const Duration(seconds: 2), () {
      getFeedbacks();
      Future.delayed(
        const Duration(seconds: 2),
        () => setState(() => showLoader = false),
      );
    });
    super.initState();
  }

  @override
  void dispose() {
    _ratingController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  final RoundedLoadingButtonController _btnController1 =
      RoundedLoadingButtonController();

  final RoundedLoadingButtonController _btnController2 =
      RoundedLoadingButtonController();

  void _onDelete(int index, RoundedLoadingButtonController controller) async {
    FeedbackService().deleteFeedback(feedbacks[index].id);
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
        title: 'Diary ${feedbacks[index].id}',
        height: 200,
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
          padding: const EdgeInsets.only(left: 18.0, right: 18.0),
          child: Column(
            children: [
              IgnorePointer(
                ignoring: true,
                child: Padding(
                  padding:
                      const EdgeInsets.only(top: 18.0, left: 10.0, right: 10.0),
                  child: RatingField(
                    label: "Rating",
                    disable: true,
                    initialValue: feedbacks[index].rating,
                  ),
                ),
              ),
              LabelField(
                labelText: "Comments",
                value: feedbacks[index].content,
                maxLines: 3,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget getLeaderCard(int index) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CustomCard(
        title: 'Diary ${feedbacks[index].id}',
        height: 200,
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
          padding: const EdgeInsets.only(left: 18.0, right: 18.0),
          child: Column(
            children: [
              IgnorePointer(
                ignoring: true,
                child: Padding(
                  padding:
                      const EdgeInsets.only(top: 18.0, left: 10.0, right: 10.0),
                  child: RatingField(
                    label: "Rating",
                    disable: true,
                    initialValue: feedbacks[index].rating,
                    itemSize: 25,
                  ),
                ),
              ),
              LabelField(
                labelText: "Comments",
                value: feedbacks[index].content,
                maxLines: 3,
              )
            ],
          ),
        ),
      ),
    );
  }

  String getDate(String dateTime) {
    List<String> arr = dateTime.split("T");
    return DateFormat("yyyy-MM-dd HH:mm:ss")
        .parse("${arr[0]} ${arr[1]}", true)
        .toLocal()
        .toString()
        .split(".")[0];
  }

  getFeedbacks() async {
    var newFeedbacks =
        await FeedbackService().getFeedbacksByTaskId(editTaskData.id);

    var filteredFeedbacks = newFeedbacks.where((i) => !i.isChecked).toList();

    setState(() {
      feedbacks = isLeader ? newFeedbacks : filteredFeedbacks;
    });
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments;
    if (args != null) {
      editTaskData = args as Task;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Task Feedback'),
        elevation: 1,
      ),
      backgroundColor: CustomColor.background,
      body: SingleChildScrollView(
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
                      sizes: 'col-sm-12 col-md-6',
                      child: CustomCard(
                        title: 'Programme Log Records',
                        height: feedbacks.length == 0 || feedbacks.length == 1
                            ? 300
                            : 520,
                        child: Padding(
                          padding: const EdgeInsets.all(25),
                          child: feedbacks.length == 0 && showLoader
                              ? Center(
                                  child: Container(
                                    color: Colors.white,
                                    width: 250.0,
                                    height: 250.0,
                                    child: SpinKitRing(
                                      color: CustomColor.primary,
                                      size: 100.0,
                                    ),
                                  ),
                                )
                              : feedbacks.length == 0 && !showLoader
                                  ? Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Feedbacks not Found',
                                          style: TextStyle(
                                            fontSize: 20,
                                            color: CustomColor.primary,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              12.0, 18.0, 8.0, 8.0),
                                          child: Container(),
                                        ),
                                      ],
                                    )
                                  : isLeader
                                      ? ListView(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 10.0, right: 5.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  ElevatedButton(
                                                    style: primaryButtonStyle,
                                                    onPressed: () {
                                                      for (var feedback
                                                          in feedbacks) {
                                                        FeedbackService()
                                                            .updateFeedbackVisibility(
                                                                feedback.id,
                                                                feedback
                                                                    .isChecked);
                                                      }
                                                      updateForm();
                                                    },
                                                    child: Text('Make Visible'),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            ListView.builder(
                                              shrinkWrap: true,
                                              itemCount: feedbacks.length,
                                              padding: const EdgeInsets.only(
                                                  top: 10.0),
                                              itemBuilder: (context, index) {
                                                return CheckboxListTile(
                                                  title: getLeaderCard(index),
                                                  activeColor:
                                                      CustomColor.primary,
                                                  autofocus: false,
                                                  controlAffinity:
                                                      ListTileControlAffinity
                                                          .leading,
                                                  value: feedbacks[index]
                                                      .isChecked,
                                                  onChanged: (val) {
                                                    setState(() {
                                                      feedbacks[index]
                                                          .isChecked = val!;
                                                    });
                                                  },
                                                );
                                              },
                                            ),
                                          ],
                                        )
                                      : ListView.builder(
                                          shrinkWrap: true,
                                          itemCount: feedbacks.length,
                                          padding:
                                              const EdgeInsets.only(top: 10.0),
                                          itemBuilder: (context, index) {
                                            return getCard(index);
                                          }),
                        ),
                      ),
                    ),
                    BootstrapCol(
                      sizes: 'col-sm-12 col-md-6',
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          CustomCard(
                            title: 'Feedback Form',
                            height: 300,
                            child: Padding(
                              padding: const EdgeInsets.all(25.0),
                              child: Form(
                                key: _feedbackFormKey,
                                child: Column(
                                  children: <Widget>[
                                    RatingField(
                                      label: "Rating",
                                      setValue: (String rating) {
                                        _ratingController.text = rating;
                                      },
                                    ),
                                    TextInputField(
                                      label: "Feedback",
                                      controller: _contentController,
                                      maxLines: 5,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 80, vertical: 55.0),
                            child: ElevatedButton(
                              style: primaryButtonStyle,
                              onPressed: () async {
                                if (editTaskData.id != 0 &&
                                    _feedbackFormKey.currentState!.validate()) {
                                  Map<String, dynamic> feedback = {
                                    'taskId': editTaskData.id,
                                    'rating': _ratingController.text,
                                    'content': _contentController.text,
                                    'createdBy': UserService.currentUser.name,
                                    'isChecked': false,
                                  };

                                  await FeedbackService().addFeedback(feedback);
                                  updateForm();
                                }
                              },
                              child: Text('Submit New Feedback'),
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

  updateForm() {
    _ratingController.clear();
    _contentController.clear();
    getFeedbacks();
    setState(() {});
  }
}
