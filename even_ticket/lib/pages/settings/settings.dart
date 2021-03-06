import 'package:even_ticket/constants/controllers.dart';
import 'package:even_ticket/constants/style.dart';
import 'package:even_ticket/utils/responsiveness.dart';
import 'package:even_ticket/widgets/custom_assets/custom_text.dart';
import 'package:even_ticket/widgets/settings_widgets/settings_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsViewPage extends StatelessWidget {
  const SettingsViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(child: SettingsCard());
  }
}
