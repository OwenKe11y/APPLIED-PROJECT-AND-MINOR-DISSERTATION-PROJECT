import 'package:even_ticket/constants/style.dart';
import 'package:even_ticket/data/event.dart';
import 'package:even_ticket/layout.dart';
import 'package:even_ticket/pages/authentication/login_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EventDetailsBackground extends StatelessWidget {
  const EventDetailsBackground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final event = Provider.of<Events>(context);

    return ClipPath(
      clipper: SideClipper(),
      child: Image(
          image: MemoryImage(event.displayImage),
          fit: BoxFit.cover,
          alignment: Alignment.topCenter,
          height: screenWidth * 0.9,
          width: screenWidth * 2,
          color: Color(0x99000000),
          colorBlendMode: BlendMode.darken),
    );
  }
}
