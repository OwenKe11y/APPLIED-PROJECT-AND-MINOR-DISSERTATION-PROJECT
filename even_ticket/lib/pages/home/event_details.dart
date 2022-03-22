// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:even_ticket/constants/controllers.dart';
import 'package:even_ticket/constants/style.dart';
import 'package:even_ticket/layout.dart';
import 'package:even_ticket/utils/application_navigator.dart';
import 'package:even_ticket/widgets/event_widgets/event_details_background.dart';
import 'package:even_ticket/widgets/event_widgets/event_details_content.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../data/event.dart';

class EventDetail extends StatelessWidget {
  final Events events;

  const EventDetail({Key? key, required this.events}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.offAll(() => SiteLayout());
        return true;
      },
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar:
            AppBar(elevation: 0, backgroundColor: Colors.transparent, actions: [
          IconButton(
            icon: Icon(Icons.close_sharp),
            iconSize: 40,
            splashRadius: 25,
            onPressed: () {
              Get.offAll(() => SiteLayout());
            },
          )
        ]),
        body: Stack(
          children: [
            Provider<Events>.value(
              value: events,
              child: Stack(
                children: [
                  EventDetailsBackground(),
                  EventDetailsContent(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
