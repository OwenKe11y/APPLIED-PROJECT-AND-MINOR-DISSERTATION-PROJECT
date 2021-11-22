import 'package:even_ticket/routing/routes.dart';
import 'package:even_ticket/constants/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MenuController extends GetxController {
  static MenuController instance = Get.find();
  var activeItem = homePageRoute.obs;
  var hoverItem = "".obs;

  changeActiveItemTo(String itemName) {
    activeItem.value = itemName;
  }

  onHover(String itemName) {
    if (!isActive(itemName)) hoverItem.value = itemName;
  }

  isActive(String itemName) => activeItem.value == itemName;

  isHovering(String itemName) => hoverItem.value == itemName;

  Widget returnIconFor(String itemName) {
    switch (itemName) {
      case homePageRoute:
        return _customIcon(Icons.home_rounded, itemName);
      case ticketsPageRoute:
        return _customIcon(Icons.book_online_rounded, itemName);
      case calenderPageRoute:
        return _customIcon(Icons.calendar_today_rounded, itemName);
      case mapsPageRoute:
        return _customIcon(Icons.map_rounded, itemName);
      case settingsPageRoute:
        return _customIcon(Icons.settings, itemName);
      case authenticationPageRoute:
        return _customIcon(Icons.exit_to_app, itemName);
      default:
        return _customIcon(Icons.exit_to_app, itemName);
    }
  }

  // ignore: unused_element
  Widget _customIcon(IconData icon, String itemName) {
    if (isActive(itemName)) {
      return Icon(icon, size: 22, color: dark);
    }
    return Icon(icon, color: isHovering(itemName) ? dark : lightGrey);
  }
}
