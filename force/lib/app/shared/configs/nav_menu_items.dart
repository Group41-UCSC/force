class NavMenuItem {
  String title;
  String routeName;

  NavMenuItem({required this.title, required this.routeName});
}

List<NavMenuItem> navMenuItems = [
  NavMenuItem(title: 'HOME', routeName: '/'),
  NavMenuItem(title: 'NEWS', routeName: '/news'),
  NavMenuItem(title: 'EVENTS', routeName: '/events'),
  NavMenuItem(title: 'ABOUT', routeName: '/about'),
  NavMenuItem(title: 'GALLERY', routeName: '/gallery'),
  NavMenuItem(title: 'OLD SCOUTS', routeName: '/oldscouts'),
  NavMenuItem(title: 'CONTACT US', routeName: '/contactus'),
];
