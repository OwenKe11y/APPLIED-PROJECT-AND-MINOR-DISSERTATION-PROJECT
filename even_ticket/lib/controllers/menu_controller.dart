import 'package:even_ticket/routing/routes.dart';
import 'package:even_ticket/constants/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Class for managing the active items and icons for the items in the side menu
class MenuController extends GetxController {
  static MenuController instance = Get.find();
  var activeItem = homePageRoute.obs;
  var hoverItem = "".obs;

  // Change the current page
  changeActiveItemTo(String itemName) {
    activeItem.value = itemName;
  }

  // These 3 methods are designed for the webview and handle the animation of using a cursor
  onHover(String itemName) {
    if (!isActive(itemName)) hoverItem.value = itemName;
  }
  isActive(String itemName) => activeItem.value == itemName;

  isHovering(String itemName) => hoverItem.value == itemName;

  // Return an icon for the menu items
  Widget returnIconFor(String itemName) {
    switch (itemName) {
      case homePageRoute:
        return _customIcon(Icons.home_rounded, itemName);
      case ticketsPageRoute:
        return _customIcon(Icons.book_online_rounded, itemName);
      case eventGenerationPageRoute:
        return _customIcon(Icons.new_label_rounded, itemName);
        case scannerPageRoute:
        return _customIcon(Icons.camera, itemName);
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
      return Icon(icon, size: 22, color: mainColour);
    }
    return Icon(icon, color: isHovering(itemName) ? mainColour : darkGrey);
  }
}
