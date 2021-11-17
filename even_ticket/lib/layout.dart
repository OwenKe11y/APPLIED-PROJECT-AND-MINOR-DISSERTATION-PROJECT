import 'package:even_ticket/utils/responsiveness.dart';
import 'package:even_ticket/widgets/large_screen.dart';
import 'package:even_ticket/widgets/medium_screen.dart';
import 'package:even_ticket/widgets/small_screen.dart';
import 'package:even_ticket/widgets/top_nav.dart';
import 'package:flutter/material.dart';

class SiteLayout extends StatelessWidget {
  const SiteLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
    return Scaffold(
      key: scaffoldKey,
      appBar: topNavBar(context, scaffoldKey),
      drawer: Drawer(),
      body: ResponsiveWidget(largeScreen: LargeScreen(), mediumScreen: MediumScreen(), smallScreen: SmallScreen()), 
    );
  }
}
