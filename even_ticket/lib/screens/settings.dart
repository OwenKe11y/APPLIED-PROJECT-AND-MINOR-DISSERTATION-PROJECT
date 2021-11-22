import 'package:even_ticket/constants/style.dart';
import 'package:even_ticket/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class SettingsViewPage extends StatelessWidget {
  const SettingsViewPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomText(text: "Settings", size: 40, color: dark, fontWeight: FontWeight.bold),
    );
  }
}