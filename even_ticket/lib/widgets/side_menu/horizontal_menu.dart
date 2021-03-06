import 'package:even_ticket/constants/controllers.dart';
import 'package:even_ticket/constants/style.dart';
import 'package:even_ticket/widgets/custom_assets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// This class populates the menu of the side bar.
// It handles the presentation of the side menu in a large screen horizontal view.
class HorizontalMenuItem extends StatelessWidget {
  final String itemName;
  final VoidCallback
      onTap; // VoidCallback as Inkwell onTap must return a void Function() not Function
  const HorizontalMenuItem(
      {Key? key, required this.itemName, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;

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
            decoration: BoxDecoration(
              color: menuController.isHovering(itemName)
                  ? darkGrey.withOpacity(.1)
                  : Colors.transparent,
              border: Border(

                bottom: BorderSide(
                  color: darkGrey.withOpacity(.1),
                  width: 1,
                ),
              ),
              
            ),
            // Colour of the container containing the item depending on it being hovered on

            child: Row(
              children: [
                // Small bar at the edge of the screen to show user what they have selected and when they are hovering
                Visibility(
                  visible: menuController.isHovering(itemName) ||
                      menuController.isActive(itemName),
                  child: Container(width: 6, height: 40, color: mainColour),
                  // Want to maintain size, state and animation of this widget
                  maintainSize: true,
                  maintainState: true,
                  maintainAnimation: true,
                ),

                SizedBox(width: _width / 80),
                // Return different icons depending on the icon name - see menu_controller.dart
                Padding(
                  padding: EdgeInsets.all(12),
                  child: menuController.returnIconFor(itemName),
                ),
                // If the item isn't active, change the colour depending on if it's being hovered on
                if (!menuController.isActive(itemName))
                  Flexible(
                      child: CustomText(
                          text: itemName,
                          size: 18,
                          color: menuController.isHovering(itemName)
                              ? mainColour
                              : darkGrey,
                          fontWeight: FontWeight.bold, textAlign: TextAlign.center,))
                // If the item is active, maintain colour
                else
                  Flexible(
                      child: CustomText(
                          text: itemName,
                          size: 18,
                          color: mainColour,
                          fontWeight: FontWeight.normal, textAlign: TextAlign.center,))
              ],
            ),
          )),
    );
  }
}
