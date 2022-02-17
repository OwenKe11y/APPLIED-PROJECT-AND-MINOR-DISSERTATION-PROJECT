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
    final event = Provider.of<Event>(context);

    return ClipPath(clipper: LoginClipper(), child: event.displayImage
        // Image.asset(
        //   ,
        //   alignment: Alignment.topCenter,
        //   fit: BoxFit.cover,
        //   width: screenWidth * 2,
        //   height: screenHeight * 0.5,
        //   color: Color(0x99000000),
        //   colorBlendMode: BlendMode.darken,
        // ),
        );
  }
}
