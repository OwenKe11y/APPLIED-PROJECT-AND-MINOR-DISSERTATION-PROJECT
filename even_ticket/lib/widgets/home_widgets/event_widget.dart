// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:even_ticket/constants/controllers.dart';
import 'package:even_ticket/constants/style.dart';
import 'package:even_ticket/data/event.dart';
import 'package:even_ticket/routing/routes.dart';
import 'package:even_ticket/utils/application_navigator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../pages/home/event_details.dart';
import '../custom_assets/custom_text.dart';

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
        child: InkWell(
          splashColor: darkGrey,
          onTap: () => {
            Future.delayed(Duration(milliseconds: 190), () {
              Get.offAll(() => EventDetail(event: event));
            })
            
          },
          child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    child: Image(
                      image: MemoryImage(event.displayImage),
                      height: 150,
                      fit: BoxFit.fitWidth,
                    ),
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
              )),
        ));
  }
}
