import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bootstrap/flutter_bootstrap.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:royalscouts/app/core/models/review.dart';
import 'package:royalscouts/app/core/models/task.dart';
import 'package:royalscouts/app/core/services/review_service.dart';
import 'package:royalscouts/app/core/services/user_service.dart';
import 'package:royalscouts/app/shared/configs/custom_color.dart';
import 'package:royalscouts/app/shared/widgets/elements/custom_card.dart';
import 'package:royalscouts/app/shared/widgets/elements/dropdown_field.dart';
import 'package:royalscouts/app/shared/widgets/elements/label_field.dart';
import 'package:royalscouts/app/shared/widgets/elements/text_input_field.dart';
import 'package:royalscouts/app/shared/widgets/styles/buttons.dart';

class TaskReviewPage extends StatefulWidget {
  const TaskReviewPage({Key? key}) : super(key: key);

  @override
  _TaskReviewPageState createState() => _TaskReviewPageState();
}

class _TaskReviewPageState extends State<TaskReviewPage> {
  Map<String, dynamic> task = Map();
  List<bool> isEmpty = [];
  final _permissionFormKey = GlobalKey<FormState>();
  final _auditFormKey = GlobalKey<FormState>();

  late Task editTaskData;

  List<Review> reviews = [];

  final _supervisionController = TextEditingController();
  final _pActionController = TextEditingController();
  final _frequencyController = TextEditingController();
  final _createdByController = TextEditingController();
  final _approvedByController = TextEditingController();
  final _commentsController = TextEditingController();

  late Timer _timer;
  bool showLoader = true;

  @override
  void initState() {
    editTaskData = Task.setEmptyTask();
    _timer = Timer(const Duration(seconds: 2), () {
      getReviews();
      Future.delayed(
        const Duration(seconds: 2),
        () => setState(() => showLoader = false),
      );
    });

    super.initState();
  }

  @override
  void dispose() {
    _supervisionController.dispose();
    _pActionController.dispose();
    _frequencyController.dispose();
    _createdByController.dispose();
    _approvedByController.dispose();
    _commentsController.dispose();
    super.dispose();
  }

  final RoundedLoadingButtonController _btnController1 =
      RoundedLoadingButtonController();

  final RoundedLoadingButtonController _btnController2 =
      RoundedLoadingButtonController();

  void _onDelete(int index, RoundedLoadingButtonController controller) async {
    ReviewService().deleteReview(reviews[index].id);
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
        title: 'Reviews ${reviews[index].id}',
        height: 290,
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
                labelText: "Reviewed By",
                value: reviews[index].reviewedBy,
              ),
              LabelField(
                labelText: "Reviewed Date",
                value: getDate(reviews[index].createdAt),
              ),
              LabelField(
                labelText: "Comments",
                value: reviews[index].comments,
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

  getReviews() async {
    var newReviews = await ReviewService().getReviewsByTaskId(editTaskData.id);
    setState(() {
      reviews = newReviews;
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
        title: const Text('Task Review'),
      ),
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
                        title: 'Review Log Records',
                        height: reviews.length == 0 ? 300 : 750,
                        child: Padding(
                          padding: const EdgeInsets.all(25),
                          child: reviews.length == 0 && showLoader
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
                              : reviews.length == 0 && !showLoader
                                  ? Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Reviews not Found',
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
                                  : ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: reviews.length,
                                      padding: const EdgeInsets.only(top: 10.0),
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
                            title: 'Permissions',
                            height: 280,
                            child: Padding(
                              padding: const EdgeInsets.all(25),
                              child: Form(
                                key: _permissionFormKey,
                                child: Column(
                                  children: <Widget>[
                                    TextInputField(
                                      label: "Supervision",
                                      controller: _supervisionController,
                                      content: editTaskData.supervision,
                                      disable: true,
                                    ),
                                    DropdownField(
                                      label: "Permission Action",
                                      contents: ["OK", "Suspend", "Banned"],
                                      controller: _pActionController,
                                    ),
                                    DropdownField(
                                      label: "Frequency",
                                      contents: [
                                        "3/m",
                                        "1/m",
                                        "1/y",
                                        "Camps",
                                        "Troops Only"
                                      ],
                                      controller: _frequencyController,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 18.0),
                            child: CustomCard(
                              title: 'Audit Trail',
                              height: 365,
                              child: Padding(
                                padding: const EdgeInsets.all(25),
                                child: Form(
                                  key: _auditFormKey,
                                  child: Column(
                                    children: <Widget>[
                                      TextInputField(
                                        label: "Created By",
                                        content: editTaskData.createdBy,
                                        controller: _createdByController,
                                        disable: true,
                                      ),
                                      TextInputField(
                                        label: "Approved By",
                                        content: editTaskData.approvedBy,
                                        controller: _approvedByController,
                                        disable: true,
                                      ),
                                      TextInputField(
                                        label: "Comments",
                                        controller: _commentsController,
                                        maxLines: 5,
                                      )
                                    ],
                                  ),
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
                                    _permissionFormKey.currentState!
                                        .validate() &&
                                    _auditFormKey.currentState!.validate()) {
                                  Map<String, dynamic> review = {
                                    'taskId': editTaskData.id,
                                    'comments': _commentsController.text,
                                    'reviewedBy': UserService.currentUser.name,
                                    'frequency': _frequencyController.text,
                                    'permissionAction': _pActionController.text,
                                  };

                                  await ReviewService().addReview(review);
                                  updateForm();
                                }
                              },
                              child: Text('Submit New Review'),
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
    _frequencyController.clear();
    _pActionController.clear();
    _commentsController.clear();
    getReviews();
    setState(() {});
  }
}
