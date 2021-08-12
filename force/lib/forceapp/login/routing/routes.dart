const rootRoute = "/";

const dashboardPageDisplayName = "Dashboard";
const dashboardPageRoute = "/dashboard";

const progress_cardPageDisplayName = "Progress Card";
const progress_cardPageRoute = "/progress_card";

const eventsPageDisplayName = "Events";
const eventsPageRoute = "/events";

const councilsPageDisplayName = "Councils";
const councilsPageRoute = "/councils";

const badge_worksPageDisplayName = "Badge Works";
const badge_worksPageRoute = "/badge_works";

const helpPageDisplayName = "Help";
const helpPageRoute = "/help";

const authenticationPageDisplayName = "Log out";
const authenticationPageRoute = "/auth";

class MenuItem {
  final String name;
  final String route;

  MenuItem(this.name, this.route);
}



List<MenuItem> sideMenuItemRoutes = [
 MenuItem(dashboardPageDisplayName, dashboardPageRoute),
 MenuItem(progress_cardPageDisplayName, progress_cardPageRoute),
 MenuItem(eventsPageDisplayName, eventsPageRoute),
  MenuItem(councilsPageDisplayName, councilsPageRoute),
  MenuItem(badge_worksPageDisplayName, badge_worksPageRoute),
  MenuItem(helpPageDisplayName, helpPageRoute),
 MenuItem(authenticationPageDisplayName, authenticationPageRoute),
];
