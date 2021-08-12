import 'package:flutter/cupertino.dart';
import 'package:force/forceapp/login/constants/controllers.dart';
import 'package:force/forceapp/login/routing/router.dart';
import 'package:force/forceapp/login/routing/routes.dart';

Navigator localNavigator() =>   Navigator(
      key: navigationController.navigatorKey,
      onGenerateRoute: generateRoute,
      initialRoute: dashboardPageRoute,
    );



