import 'package:flutter/material.dart';
import 'package:royalscouts/app/modules/admin/crud_task/crud_task_page.dart';
import 'package:royalscouts/app/modules/public/events/events.dart';
import 'app/modules/admin/admin_home/admin_home.dart';
import 'app/modules/admin/task_feedback/task_feedback_page.dart';
import 'app/modules/admin/task_review/task_review_page.dart';
import 'app/modules/public/about/pages/about.dart';
import 'app/modules/public/contact_us/pages/contact_us.dart';
import 'app/modules/public/gallery/gallery.dart';
import 'app/modules/public/homepage/homepage.dart';
import 'app/modules/public/news/pages/news.dart';
import 'app/modules/public/news/pages/news_content.dart';
import 'app/modules/public/oldscouts/old-scouts.dart';
import 'app/shared/configs/custom_color.dart';

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
      ),
      initialRoute: '/admin',
      routes: {
        '/': (context) => HomePage(),
        '/news': (context) => News(),
        '/news-content': (context) => NewsContent(),
        '/about': (context) => About(),
        '/gallery': (context) => Gallery(),
        '/contactus': (context) => ContactUs(),
        '/oldscouts': (context) => OldScouts(),
        '/events': (context) => Events(),
        '/admin': (context) => AdminHome(),
        '/admin/add-task': (context) => CrudTaskPage(),
        '/admin/edit-task': (context) => CrudTaskPage(),
        '/admin/view-task': (context) => CrudTaskPage(),
        '/admin/task-review': (context) => TaskReviewPage(),
        '/admin/task-feedback': (context) => TaskFeedbackPage(),
      },
    );
  }
}
