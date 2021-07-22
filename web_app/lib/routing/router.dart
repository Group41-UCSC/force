import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/pages/badge_works/badge_works.dart';
import 'package:flutter_web_dashboard/pages/councils/councils.dart';
import 'package:flutter_web_dashboard/pages/events/events.dart';
import 'package:flutter_web_dashboard/pages/help/help.dart';
import 'package:flutter_web_dashboard/pages/progress_card/progress_card.dart';
import 'package:flutter_web_dashboard/pages/dashboard/dashboard.dart';
import 'package:flutter_web_dashboard/routing/routes.dart';

Route<dynamic> generateRoute(RouteSettings settings){
  switch (settings.name) {
    case dashboardPageRoute:
      return _getPageRoute(DashboardPage());
    case progress_cardPageRoute:
      return _getPageRoute(ProgressCardPage());
    case eventsPageRoute:
      return _getPageRoute(EventsPage());
    case councilsPageRoute:
      return _getPageRoute(CouncilsPage());
    case badge_worksPageRoute:
      return _getPageRoute(BadgeWorksPage());
    case helpPageRoute:
      return _getPageRoute(HelpPage());
    default:
      return _getPageRoute(DashboardPage());

  }
}

PageRoute _getPageRoute(Widget child){
  return MaterialPageRoute(builder: (context) => child);
}