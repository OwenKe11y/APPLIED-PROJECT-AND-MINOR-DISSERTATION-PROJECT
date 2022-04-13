// ignore_for_file: prefer_const_constructors

import 'package:even_ticket/constants/style.dart';
import 'package:even_ticket/data/user.dart';
import 'package:even_ticket/layout.dart';
import 'package:even_ticket/utils/application_navigator.dart';
import 'package:even_ticket/widgets/side_menu/side_menu.dart';
import 'package:flutter/material.dart';

// Class for rendering the pages in a Large Screen layout
class LargeScreen extends StatelessWidget {
  const LargeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height * 0.5;
    // Seperate the entire page into two Rows:
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // The Side Menu
        Expanded(child: SideMenu()),
        // The Page with the content
        Expanded(
          flex: 5,
          // This container renders page background colour, !!DO NOT FORGET THIS!!
          child: Stack(
            children: [
              ClipPath(
                  clipper: BottomShapeClipper(),
                  child: currentUser.isOrganiser
                      ? setColour(Colors.purple.shade700, screenHeight)
                      : setColour(Colors.green.shade700, screenHeight)),
              WillPop()
            ],
          ),
        ),
      ],
    );
  }
}
