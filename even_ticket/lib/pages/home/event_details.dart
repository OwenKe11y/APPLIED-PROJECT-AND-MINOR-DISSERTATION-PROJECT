// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:even_ticket/widgets/home_widgets/event_details_background.dart';
import 'package:even_ticket/widgets/home_widgets/event_details_content.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/event.dart';

class EventDetail extends StatelessWidget {
  final Event event;

  const EventDetail({Key? key, required this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Provider<Event>.value(
        value: event,
        child: Stack(
          children: [
            EventDetailsBackground(),
            EventDetailsContent(),
          ],
        ),
      ),
    );
  }
}
