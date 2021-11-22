// ignore_for_file: prefer_const_constructors

import 'package:even_ticket/constants/controllers.dart';
import 'package:even_ticket/constants/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'custom_text.dart';

// This class populates the menu of the side bar.
// It handles the presentation of the side menu in a small screen vertical view.
class VerticalMenuItem extends StatelessWidget {
  final String itemName;
  final /*Function*/ VoidCallback
      onTap; // VoidCallback as Inkwell onTap must return a void Function() not Function
  const VerticalMenuItem(
      {Key? key, required this.itemName, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Inkwell widget to have access to the onHover property
    return InkWell(
      onTap: onTap,
      onHover: (value) {
        // if Hovering or not hovering, change value appropriate
        value
            ? menuController.onHover(itemName)
            : menuController.onHover("not hovering");
      },
      // Getx observable as the value changes and we want to keep an eye on it
      child: Obx(() => Container(
            color: menuController.isHovering(itemName)
                ? lightGrey.withOpacity(.1)
                : Colors.transparent,
            child: Row(children: [
              // Small bar at the edge of the screen to show user what they have selected and when they are hovering
              Visibility(
                visible: menuController.isHovering(itemName) ||
                    menuController.isActive(itemName),
                child: Container(width: 3, height: 72, color: dark),
                // Want to maintain size, state and animation of this widget
                maintainSize: true,
                maintainState: true,
                maintainAnimation: true,
              ),
              Expanded(
                  child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Return different icons depending on the icon name - see menu_controller.dart
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: menuController.returnIconFor(itemName),
                  ),
                  if (!menuController.isActive(itemName))
                    Flexible(
                        child: CustomText(
                            text: itemName,
                            size: 18,
                            color: menuController.isHovering(itemName)
                                ? dark
                                : lightGrey,
                            fontWeight: FontWeight.normal))
                  // If the item is active, maintain colour
                  else
                    Flexible(
                        child: CustomText(
                            text: itemName,
                            size: 18,
                            color: dark,
                            fontWeight: FontWeight.normal))
                ],
              ))
            ]),
          )),
    );
  }
}
