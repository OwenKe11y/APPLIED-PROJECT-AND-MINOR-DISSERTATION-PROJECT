import 'package:even_ticket/constants/controllers.dart';
import 'package:even_ticket/constants/style.dart';
import 'package:even_ticket/utils/responsiveness.dart';
import 'package:even_ticket/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsViewPage extends StatelessWidget {
  const SettingsViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Obx(() => Row(children: [
                Container(
                  margin: EdgeInsets.only(
                    top: ResponsiveWidget.isSmallScreen(context) ? 42 : 6,
                    left: ResponsiveWidget.isSmallScreen(context) ? 50 : 6,
                  ),
                  child: CustomText(
                      text: menuController.activeItem.value,
                      size: 25,
                      color: lightGrey,
                      fontWeight: FontWeight.bold),
                ),
              ]))
        ],
      ),
    );
  }
}
