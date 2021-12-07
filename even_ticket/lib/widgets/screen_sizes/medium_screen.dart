// ignore_for_file: prefer_const_constructors

import 'package:even_ticket/constants/style.dart';
import 'package:even_ticket/utils/local_navigator.dart';
import 'package:even_ticket/widgets/side_menu/side_menu.dart';
import 'package:flutter/material.dart';

// Class for rendering the pages in a Medium Screen layout
class MediumScreen extends StatelessWidget {
  const MediumScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Colors.green.shade900, Colors.green, Colors.green.shade200])),
             
              child: localNavigator(),
            ))
      ],
    );
  }
}

