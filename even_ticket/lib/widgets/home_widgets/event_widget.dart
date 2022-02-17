// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:even_ticket/constants/style.dart';
import 'package:even_ticket/data/event.dart';
import 'package:flutter/material.dart';

import '../custom_text.dart';

class EventWidget extends StatelessWidget {
  final Event event;
  const EventWidget({Key? key, required this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.symmetric(vertical: 20),
        elevation: 4,
        color: light,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(24))),
        child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  child: event.galleryImages[0],
                ),
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
                                  text: event.title,
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
                                      Icon(Icons.location_on),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      CustomText(
                                        color: darkGrey,
                                        text: event.location,
                                        size: 16,
                                        fontWeight: FontWeight.w300,
                                        textAlign: TextAlign.left,
                                      ),
                                    ],
                                  ),
                                )
                              ])),
                      Expanded(
                        flex: 1,
                        child: CustomText(
                          color: darkGrey,
                          text: event.duration,
                          size: 16,
                          fontWeight: FontWeight.w900,
                          textAlign: TextAlign.right,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )));
  }
}
