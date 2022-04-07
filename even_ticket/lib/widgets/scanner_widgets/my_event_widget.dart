// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:even_ticket/constants/controllers.dart';
import 'package:even_ticket/constants/style.dart';
import 'package:even_ticket/data/event.dart';
import 'package:even_ticket/pages/purchase/purchase_page.dart';
import 'package:even_ticket/routing/routes.dart';
import 'package:even_ticket/services/http_methods.dart';
import 'package:even_ticket/utils/application_navigator.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../pages/home/event_details.dart';
import '../custom_assets/custom_text.dart';

class MyEventWidget extends StatelessWidget {
  final Events events;
  const MyEventWidget({Key? key, required this.events}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
            margin: EdgeInsets.symmetric(vertical: 10),
            elevation: 4,
            color: light,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(24))),
            child: InkWell(
              splashColor: darkGrey,
              onTap: () => {
                Future.delayed(Duration(milliseconds: 190), () {
                  Get.offAll(() => EventDetail(
                        events: events,
                      ));
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
                          image: MemoryImage(events.displayImage),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CustomText(
                                        color: darkGrey,
                                        text: events.title,
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
                                              text: events.location,
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
                                            Icon(Icons.euro_symbol_sharp),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            CustomText(
                                              color: darkGrey,
                                              text: events.price,
                                              size: 24,
                                              fontWeight: FontWeight.bold,
                                              textAlign: TextAlign.left,
                                            ),
                                          ],
                                        ),
                                      )
                                    ])),
                            Expanded(
                              flex: 0,
                              child: FaIcon(Icons.touch_app, color: darkGrey),
                            ),
                          ],
                        ),
                      )
                    ],
                  )),
            )),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: mainColour,
            onPrimary: Colors.black,
            minimumSize: Size(double.infinity, 50),
          ),
          onPressed: () async {
            final result = await showDialog(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                title: Text("Confirm?"),
                content:
                    Text("Are you sure you would like to delete this Event?"),
                actions: <Widget>[
                  TextButton(
                      onPressed: () => {
                      deleteEvent(events.title),  
                      Navigator.pop(context)},
                      child: Text("Yes")
                      
                      ),
                  
                  TextButton(
                      onPressed: () => {Navigator.pop(context)},
                      child: Text("No")),
                ],
              ),
            );
            return result;
          },
          child: CustomText(
            text: 'Delete Event',
            size: 16,
            color: light,
            fontWeight: FontWeight.bold,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
