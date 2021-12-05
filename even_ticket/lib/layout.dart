// ignore_for_file: prefer_const_constructors

import 'package:even_ticket/constants/style.dart';
import 'package:even_ticket/utils/local_navigator.dart';
import 'package:even_ticket/utils/responsiveness.dart';
import 'package:even_ticket/widgets/screen_sizes/large_screen.dart';
import 'package:even_ticket/widgets/screen_sizes/medium_screen.dart';
import 'package:even_ticket/widgets/side_menu/side_menu.dart';
import 'package:even_ticket/widgets/top_nav.dart';
import 'package:flutter/material.dart';

// Class for determining responsive page layout, out putting the correct screen depending on the size
class SiteLayout extends StatelessWidget {
  const SiteLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
    // Always render the top bar regardless of page size
    return Scaffold(
        key: scaffoldKey,
        appBar: topNavBar(context, scaffoldKey),
        drawer: Drawer(
          child: SideMenu(),
        ),
        // Chnage the body of the page depending on the screen size
        body: ResponsiveWidget(
            largeScreen: LargeScreen(),
            mediumScreen: MediumScreen(),
            smallScreen: 
            // This container renders page background colour, !!DO NOT FORGET THIS!!
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              color: lightGrey,
              child: localNavigator(),
            )));
  }
}
