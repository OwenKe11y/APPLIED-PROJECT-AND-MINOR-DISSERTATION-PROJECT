import 'package:even_ticket/utils/responsiveness.dart';
import 'package:even_ticket/widgets/horizontal_menu.dart';
import 'package:even_ticket/widgets/vertical_menu_item.dart';
import 'package:flutter/material.dart';

// Class for deciding to use the Vertical or Horizontal Side Menu Items
class SideMenuItem extends StatelessWidget {
  final String itemName;
  final VoidCallback onTap; // VoidCallback as Inkwell onTap must return a void Function() not Function
  const SideMenuItem({Key? key, required this.itemName, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Return vertical menu item if the screen size is small
    if (ResponsiveWidget.isSmallScreen(context)) {
      return VerticalMenuItem(itemName: itemName, onTap: onTap);
    }
    // Otherwise use the horizontal menu
    return HorizontalMenuItem(itemName: itemName, onTap: onTap);
  }
}
