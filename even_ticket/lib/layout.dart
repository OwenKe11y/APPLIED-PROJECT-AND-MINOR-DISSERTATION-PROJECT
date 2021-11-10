import 'package:even_ticket/utils/responsiveness.dart';
import 'package:even_ticket/widgets/large_screen.dart';
import 'package:even_ticket/widgets/medium_screen.dart';
import 'package:even_ticket/widgets/small_screen.dart';
import 'package:flutter/material.dart';

class SiteLayout extends StatelessWidget {
  const SiteLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.blueGrey[700],
      ),
      body: ResponsiveWidget(largeScreen: LargeScreen(), mediumScreen: MediumScreen(), smallScreen: SmallScreen()), 
    );
  }
}
