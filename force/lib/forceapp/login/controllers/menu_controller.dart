import 'package:flutter/material.dart';
import 'package:force/forceapp/login/constants/style.dart';
import 'package:force/forceapp/login/routing/routes.dart';
import 'package:get/get.dart';

class MenuController extends GetxController {
  static MenuController instance = Get.find();
  var activeItem = dashboardPageDisplayName.obs;

  var hoverItem = "".obs;

  changeActiveItemTo(String itemName) {
    activeItem.value = itemName;
  }

  onHover(String itemName) {
    if (!isActive(itemName)) hoverItem.value = itemName;
  }

  isHovering(String itemName) => hoverItem.value == itemName;

  isActive(String itemName) => activeItem.value == itemName;

  Widget returnIconFor(String itemName) {
    switch (itemName) {
      case dashboardPageDisplayName:
        return _customIcon(Icons.dashboard, itemName);
      case progress_cardPageDisplayName:
        return _customIcon(Icons.analytics_outlined, itemName);
      case eventsPageDisplayName:
        return _customIcon(Icons.airplay, itemName);
      case councilsPageDisplayName:
        return _customIcon(Icons.auto_awesome_mosaic , itemName);
      case badge_worksPageDisplayName:
        return _customIcon(Icons.badge, itemName);
      case helpPageDisplayName:
        return _customIcon(Icons.help_center, itemName);
      case authenticationPageDisplayName:
        return _customIcon(Icons.exit_to_app, itemName);
      default:
        return _customIcon(Icons.exit_to_app, itemName);
    }
  }

  Widget _customIcon(IconData icon, String itemName) {
    if (isActive(itemName)) return Icon(icon, size: 22, color: dark);

    return Icon(
      icon,
      color: isHovering(itemName) ? dark : lightGrey,
    );
  }
}
