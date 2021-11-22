import 'package:even_ticket/constants/style.dart';
import 'package:even_ticket/utils/local_navigator.dart';
import 'package:even_ticket/widgets/side_menu.dart';
import 'package:flutter/material.dart';

class LargeScreen extends StatelessWidget {
  const LargeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: SideMenu()),
        Expanded(flex: 5, 
        child: localNavigator()),
        Container(
          color: dark,
        )
      ],
    );
  }
}
