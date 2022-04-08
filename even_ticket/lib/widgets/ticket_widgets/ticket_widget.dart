
// ignore_for_file: prefer_const_constructors

import 'package:even_ticket/constants/style.dart';
import 'package:even_ticket/data/event.dart';
import 'package:even_ticket/data/ticket.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../../pages/home/event_details.dart';
import '../custom_assets/custom_text.dart';

class TicketWidget extends StatelessWidget {
  final Ticket tickets;
  const TicketWidget({Key? key, required this.tickets}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.symmetric(vertical: 10),
        elevation: 4,
        color: light,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(24))),
        child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10.0, left: 8.0),
                  child: Row(
                    children: [
                      Expanded(
                          flex: 2,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomText(
                                  color: darkGrey,
                                  text: "Ticket ID: " + tickets.id.toString(),
                                  size: 24,
                                  fontWeight: FontWeight.bold,
                                  textAlign: TextAlign.start,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                FittedBox(
                                  child: Row(
                                    children: [
                                    
                                      CustomText(
                                        color: darkGrey,
                                        text: "Event: " + tickets.event_name,
                                        size: 16,
                                        fontWeight: FontWeight.w300,
                                        textAlign: TextAlign.left,
                                      ),
                                    ],
                                  ),
                                ),
                                FittedBox(
                                  child: Row(
                                    children: [
                                     
                                      CustomText(
                                        color: darkGrey,
                                        text: "Owner: " + tickets.owner,
                                        size: 16,
                                        fontWeight: FontWeight.bold,
                                        textAlign: TextAlign.left,
                                      ),
                                    ],
                                  ),
                                )
                              ])),
                     
                    ],
                  ),
                )
              ],
            )));
  }
}
