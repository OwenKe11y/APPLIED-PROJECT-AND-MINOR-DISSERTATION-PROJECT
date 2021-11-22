// ignore_for_file: prefer_const_constructors

import 'package:even_ticket/constants/controllers.dart';
import 'package:even_ticket/constants/style.dart';
import 'package:even_ticket/routing/routes.dart';
import 'package:even_ticket/utils/responsiveness.dart';
import 'package:even_ticket/widgets/custom_text.dart';
import 'package:even_ticket/widgets/side_menu_items.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return Container(
      color: darkGrey,
      child: ListView(
        children: [
          if (ResponsiveWidget.isSmallScreen(context))
            Column(
              mainAxisSize: MainAxisSize.min,
            ),
          SizedBox(width: _width / 48),
          Divider(
            color: lightGrey.withOpacity(.1),
            height: 1,
          ),
          Column(
              mainAxisSize: MainAxisSize.min,
              children: dashboardItems
                  .map((itemName) => SideMenuItem(
                        itemName: itemName == authenticationPageRoute
                            ? "Log Out"
                            : itemName,
                        onTap: () {
                          if (itemName == authenticationPageRoute) {
                            // TODO: Go to Authentication page
                          }

                          if (!menuController.isActive(itemName)) {
                            menuController.changeActiveItemTo(itemName);
                            if (ResponsiveWidget.isSmallScreen(context)) {
                              Get.back();
                            }
                              navigationController.navigateTo(itemName);
                            
                          }
                        },
                      ))
                  .toList())
        ],
      ),
    );
  }
}
