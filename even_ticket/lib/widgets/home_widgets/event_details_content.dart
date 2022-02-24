// ignore_for_file: prefer_const_constructors

import 'package:even_ticket/constants/style.dart';
import 'package:even_ticket/data/event.dart';
import 'package:even_ticket/layout.dart';
import 'package:even_ticket/widgets/custom_assets/custom_text.dart';
import 'package:even_ticket/widgets/home_widgets/maps_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../constants/controllers.dart';
import '../../routing/routes.dart';

class EventDetailsContent extends StatelessWidget {
  const EventDetailsContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final event = Provider.of<Event>(context);
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: Padding(
            padding: EdgeInsets.only(top: screenHeight * 0.1),
            child: Column(
              children: [
                // Main Title Text
                Padding(
                  padding: EdgeInsets.only(right: screenWidth * 0.15),
                  child: Align(
                    alignment: FractionalOffset.centerRight,
                    child: Container(
                      alignment: Alignment.topRight,
                      height: screenHeight * 0.25,
                      width: screenWidth * 0.6,
                      child: CustomText(
                          text: event.title,
                          size: 50,
                          color: light,
                          fontWeight: FontWeight.bold,
                          textAlign: TextAlign.end),
                    ),
                  ),
                ),

                // Location Text
                Padding(
                  padding: EdgeInsets.only(left: screenWidth * 0.03),
                  child: Align(
                    alignment: FractionalOffset.centerLeft,
                    child: Container(
                        alignment: Alignment.topRight,
                        height: screenHeight * 0.03,
                        width: screenWidth * 0.6,
                        child: Row(
                          children: [
                            CustomText(
                                text: "-",
                                size: 25,
                                color: darkGrey,
                                fontWeight: FontWeight.normal,
                                textAlign: TextAlign.end),
                            Icon(
                              Icons.location_on,
                              color: darkGrey,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            CustomText(
                              color: darkGrey,
                              text: event.location,
                              size: 18,
                              fontWeight: FontWeight.w900,
                              textAlign: TextAlign.right,
                            ),
                          ],
                        )),
                  ),
                ),

                // Card for interactions
                SizedBox(
                  height: screenHeight * 0.12,
                  child: Card(
                    elevation: 5,
                    color: light,
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // Login Button - Global navigation to the main page
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: screenWidth * 0.03),
                                child: ElevatedButton.icon(
                                  style: ElevatedButton.styleFrom(
                                    primary: darkgreen,
                                    onPrimary: Colors.black,
                                  ),
                                  onPressed: () =>
                                      loginNavController.navigateTo(loginRoute),
                                  icon: FaIcon(FontAwesomeIcons.heart,
                                      color: light),
                                  label: CustomText(
                                    text: ' Like',
                                    size: 16,
                                    color: light,
                                    fontWeight: FontWeight.bold,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // Login Button - Global navigation to the main page
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: screenWidth * 0.001),
                                child: ElevatedButton.icon(
                                  style: ElevatedButton.styleFrom(
                                    primary: darkgreen,
                                    onPrimary: Colors.black,
                                  ),
                                  onPressed: () =>
                                      loginNavController.navigateTo(loginRoute),
                                  icon: FaIcon(FontAwesomeIcons.shareAlt,
                                      color: light),
                                  label: CustomText(
                                    text: ' Share',
                                    size: 16,
                                    color: light,
                                    fontWeight: FontWeight.bold,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // Login Button - Global navigation to the main page
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: screenWidth * 0.03,
                                ),
                                child: ElevatedButton.icon(
                                  style: ElevatedButton.styleFrom(
                                    primary: darkgreen,
                                    onPrimary: Colors.black,
                                  ),
                                  onPressed: () =>
                                      loginNavController.navigateTo(loginRoute),
                                  icon: FaIcon(FontAwesomeIcons.shoppingBasket,
                                      color: light),
                                  label: CustomText(
                                    text: ' Buy Ticket',
                                    size: 16,
                                    color: light,
                                    fontWeight: FontWeight.bold,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
            flex: 1,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: RichText(
                      text: TextSpan(children: [
                        TextSpan(
                            text: event.punchLine1 + " ",
                            style: TextStyle(
                                color: darkgreen,
                                fontSize: 30,
                                fontWeight: FontWeight.bold)),
                        TextSpan(
                            text: event.punchline2,
                            style: TextStyle(
                                color: darkGrey,
                                fontSize: 30,
                                fontWeight: FontWeight.bold))
                      ]),
                    ),
                  ),
                  if (event.description.isNotEmpty)
                    Padding(
                      padding: EdgeInsets.all(16),
                      child: CustomText(
                          text: event.description,
                          size: 20,
                          color: darkGrey,
                          fontWeight: FontWeight.w300,
                          textAlign: TextAlign.center),
                    ),
                  SizedBox(
                    height: 30,
                  ),
                  if (event.galleryImages.isNotEmpty)
                    Padding(
                      padding: EdgeInsets.only(left: 16.0, top: 16, bottom: 16),
                      child: CustomText(
                          text: "GALLERY",
                          size: 16,
                          color: darkGrey,
                          fontWeight: FontWeight.bold,
                          textAlign: TextAlign.start),
                    ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        for (final galleryImage in event.galleryImages)
                          Container(
                            margin: EdgeInsets.only(
                                left: 16, right: 16, bottom: 32),
                            child: ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              child: Image(
                                  image: MemoryImage(galleryImage),
                                  width: 180,
                                  height: 180,
                                  fit: BoxFit.cover),
                            ),
                          )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 16.0, top: 16, bottom: 16),
                    child: CustomText(
                        text: "MAP",
                        size: 16,
                        color: darkGrey,
                        fontWeight: FontWeight.bold,
                        textAlign: TextAlign.start),
                  ),
                  Container(
                    height: screenHeight * .75,
                    width: screenWidth * 1,
                    child: MapScreen(),
                  )
                ],
              ),
            )),
      ],
    );
  }
}
