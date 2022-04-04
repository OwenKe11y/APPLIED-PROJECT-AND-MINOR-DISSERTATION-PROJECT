// ignore_for_file: prefer_const_constructors

import 'package:even_ticket/constants/controllers.dart';
import 'package:even_ticket/constants/style.dart';
import 'package:even_ticket/data/user.dart';
import 'package:even_ticket/pages/authentication/register_page.dart';
import 'package:even_ticket/pages/authentication/welcome_page.dart';
import 'package:even_ticket/routing/routes.dart';
import 'package:even_ticket/services/google_signin_api.dart';
import 'package:even_ticket/utils/application_navigator.dart';
import 'package:even_ticket/utils/responsiveness.dart';
import 'package:even_ticket/widgets/side_menu/side_menu_items.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return Container(
      color: light,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
        children: [
          
          ListView(
            shrinkWrap: true,
            children: [
              if (ResponsiveWidget.isSmallScreen(context))
                Column(
                  mainAxisSize: MainAxisSize.min,
                ),
              SizedBox(width: _width / 12),
              Divider(
                color: darkGrey.withOpacity(.1),
                height: 1,
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: currentUser.isOrganiser
                    ? organiserItems
                        .map((itemName) => SideMenuItem(
                              itemName: itemName == authenticationPageRoute
                                  ? "Log Out"
                                  : itemName,
                              onTap: () async {
                                if (itemName == authenticationPageRoute) {
                                  if (currentUser.password == null) {
                                    mainColour = Colors.green.shade700;
                                    await GoogleSignInApi.logout();
                                    Get.offAll(() => loginNavigator());
                                  } else {
                                    mainColour = Colors.green.shade700;
                                    currentUser = null;
                                    Get.offAll(() => loginNavigator());
                                  }
                                }

                                if (!menuController.isActive(itemName)) {
                                  menuController.changeActiveItemTo(itemName);
                                  if (ResponsiveWidget.isSmallScreen(context)) {
                                    Get.back();
                                  }

                                  localNavController.navigateTo(itemName);
                                }
                              },
                            ))
                        .toList()
                    : userItems
                        .map((itemName) => SideMenuItem(
                              itemName: itemName == authenticationPageRoute
                                  ? "Log Out"
                                  : itemName,
                              onTap: () async {
                                if (itemName == authenticationPageRoute) {
                                  if (currentUser.password == null) {
                                    mainColour = Colors.green.shade700;
                                    await GoogleSignInApi.logout();
                                    Get.offAll(() => loginNavigator());
                                  } else {
                                    mainColour = Colors.green.shade700;
                                    currentUser = null;
                                    Get.offAll(() => loginNavigator());
                                  }
                                }

                                if (!menuController.isActive(itemName)) {
                                  menuController.changeActiveItemTo(itemName);
                                  if (ResponsiveWidget.isSmallScreen(context)) {
                                    Get.back();
                                  }

                                  localNavController.navigateTo(itemName);
                                }
                              },
                            ))
                        .toList(),
              ),
            ],
          ),
          Spacer(),
          ListView(
            shrinkWrap: true,
            children: [
              if (ResponsiveWidget.isSmallScreen(context))
                Column(
                  mainAxisSize: MainAxisSize.min,
                ),
              SizedBox(width: _width / 12),
              Divider(
                color: darkGrey.withOpacity(.1),
                height: 1,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: unionItems
                    .map((itemName) => SideMenuItem(
                          itemName: itemName == authenticationPageRoute
                              ? "Log Out"
                              : itemName,
                          onTap: () async {
                            if (itemName == authenticationPageRoute) {
                              if (currentUser.password == null) {
                                mainColour = Colors.green.shade700;
                                await GoogleSignInApi.logout();
                                Get.offAll(() => loginNavigator());
                              } else {
                                mainColour = Colors.green.shade700;
                                currentUser = null;
                                Get.offAll(() => loginNavigator());
                              }
                            }

                            if (!menuController.isActive(itemName)) {
                              menuController.changeActiveItemTo(itemName);
                              if (ResponsiveWidget.isSmallScreen(context)) {
                                Get.back();
                              }

                              localNavController.navigateTo(itemName);
                            }
                          },
                        ))
                    .toList(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
