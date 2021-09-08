import 'package:flutter/material.dart';

import 'app/modules/admin/admin_dashboard/admin_dashboard.dart';
import 'app/modules/admin/task_module/crud_task/crud_task_page.dart';
import 'app/modules/admin/task_module/task_evaluation/task_evaluation_page.dart';
import 'app/modules/admin/task_module/task_feedback/task_feedback_page.dart';
import 'app/modules/admin/task_module/task_home_page/task_home_page.dart';
import 'app/modules/admin/task_module/task_report/app.dart';
import 'app/modules/admin/task_module/task_review/task_review_page.dart';
import 'app/modules/public/about/pages/about.dart';
import 'app/modules/public/contact_us/pages/contact_us.dart';
import 'app/modules/public/events/events.dart';
import 'app/modules/public/gallery/gallery.dart';
import 'app/modules/public/homepage/homepage.dart';
import 'app/modules/public/news/pages/news.dart';
import 'app/modules/public/news/pages/news_content.dart';
import 'app/modules/public/oldscouts/old-scouts.dart';
import 'app/shared/configs/custom_color.dart';
import 'app/shared/configs/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Roboto',
        scaffoldBackgroundColor: Colors.white,
        primaryColor: CustomColor.primary,
        accentColor: CustomColor.accent,
      ),
      initialRoute: Routes.adminDashboard,
      routes: {
        '/': (context) => HomePage(),
        '/news': (context) => News(),
        '/news-content': (context) => NewsContent(),
        '/about': (context) => About(),
        '/gallery': (context) => Gallery(),
        '/contactus': (context) => ContactUs(),
        '/oldscouts': (context) => OldScouts(),
        '/events': (context) => Events(),
        Routes.adminDashboard: (context) => AdminDashboard(),
        Routes.taskHome: (context) => TaskHomePage(),
        Routes.addTask: (context) => CrudTaskPage(),
        Routes.editTask: (context) => CrudTaskPage(),
        Routes.viewTask: (context) => CrudTaskPage(),
        Routes.taskReview: (context) => TaskReviewPage(),
        Routes.taskFeedback: (context) => TaskFeedbackPage(),
        Routes.taskEvaluation: (context) => TaskEvaluationPage(),
        Routes.taskReport: (context) => TaskReport(),
      },
    );
  }
}
