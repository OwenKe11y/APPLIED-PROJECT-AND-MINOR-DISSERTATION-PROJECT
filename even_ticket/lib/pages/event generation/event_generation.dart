// ignore_for_file: prefer_const_constructors

import 'package:even_ticket/widgets/home_widgets/event_generation_widget.dart';
import 'package:flutter/material.dart';

class EventGenerationPage extends StatelessWidget {
  const EventGenerationPage({Key? key}) : super(key: key);

   @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(child: EventGenCard());
    
          
  }
}
