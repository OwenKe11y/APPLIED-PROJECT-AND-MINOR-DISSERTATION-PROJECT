import 'package:even_ticket/utils/local_navigator.dart';
import 'package:even_ticket/widgets/side_menu.dart';
import 'package:flutter/material.dart';

class MediumScreen extends StatelessWidget {
  const MediumScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: SideMenu()),
        Expanded(flex: 5, child: localNavigator()),
      ],
    );
  }
}
