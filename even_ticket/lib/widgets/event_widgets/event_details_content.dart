// ignore_for_file: prefer_const_constructors

import 'package:add_2_calendar/add_2_calendar.dart';
import 'package:even_ticket/constants/style.dart';
import 'package:even_ticket/data/event.dart';
import 'package:even_ticket/data/user.dart';
import 'package:even_ticket/layout.dart';
import 'package:even_ticket/pages/purchase/purchase_page.dart';
import 'package:even_ticket/widgets/custom_assets/custom_text.dart';
import 'package:even_ticket/widgets/home_widgets/maps_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:like_button/like_button.dart';
import 'package:provider/provider.dart';

import '../../constants/controllers.dart';
import '../../routing/routes.dart';

class EventDetailsContent extends StatefulWidget {
  const EventDetailsContent({Key? key}) : super(key: key);

  @override
  State<EventDetailsContent> createState() => _EventDetailsContentState();
}

class _EventDetailsContentState extends State<EventDetailsContent> {
  @override
  Widget build(BuildContext context) {
    final event = Provider.of<Events>(context);
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    //currentUser;

    // Calendar class containing the event details
    Event buildEvent({Recurrence? recurrence}) {
      return Event(
        title: event.title,
        description: event.description,
        location: event.location,
        startDate: event.date,
        endDate: event.date.add(Duration(hours: 3)),
        allDay: false,
        iosParams: IOSParams(
          reminder: Duration(hours: 1),
        ),
        androidParams: AndroidParams(
          emailInvites: [currentUser.email],
        ),
        recurrence: recurrence,
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: Padding(
            padding: EdgeInsets.only(top: screenHeight * 0.07),
            child: Column(
              children: [
                // Main Title Text
                Padding(
                  padding: EdgeInsets.only(
                    right: screenWidth * 0.15,
                  ),
                  child: Align(
                    alignment: FractionalOffset.centerRight,
                    child: Container(
                      alignment: Alignment.topRight,
                      height: screenHeight * 0.220,
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
                        height: screenHeight * 0.09,
                        width: screenWidth * 0.6,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Row(
                              children: [
                               Icon(Icons.euro_symbol),
                                SizedBox(
                                  width: 5,
                                ),
                                CustomText(
                                  color: darkGrey,
                                  text: event.price
                                      .toString(), // event.date.toString().split(" ")[0]
                                  size: 18,
                                  fontWeight: FontWeight.w900,
                                  textAlign: TextAlign.right,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                FaIcon(FontAwesomeIcons.clock, color: darkGrey),
                                SizedBox(
                                  width: 5,
                                ),
                                CustomText(
                                  color: darkGrey,
                                  text: event.time
                                      .toString(), // event.date.toString().split(" ")[0]
                                  size: 18,
                                  fontWeight: FontWeight.w900,
                                  textAlign: TextAlign.right,
                                ),
                              ],
                            ),
                            Row(
                              children: [
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
                            ),
                          ],
                        )),
                  ),
                ),

                // Card for interactions
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 0.1,
                        blurRadius: 5,
                        offset: Offset(
                          0,
                          10,
                        ), // changes position of shadow
                      ),
                    ],
                  ),
                  height: screenHeight * 0.12,
                  width: screenWidth * 1,
                  child: Container(
                    color: light,
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: screenWidth * 0.03),
                          child: Container(
                            width: screenWidth * 0.25,
                            height: screenHeight * 0.071,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                                color: mainColour),
                            child: ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(0)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  // Login Button - Global navigation to the main page

                                  LikeButton(
                                    size: screenWidth * 0.135,
                                    circleColor: CircleColor(
                                        end: light, start: lightGrey),
                                    bubblesColor: BubblesColor(
                                        dotPrimaryColor: light,
                                        dotSecondaryColor: lightGrey),
                                    bubblesSize: 60,
                                    onTap: onLikeButtonTapped,
                                    likeBuilder: (isLiked) {
                                      return Icon(
                                        isLiked
                                            ? Icons.favorite
                                            : Icons.favorite_outline,
                                        color: light,
                                        size: 40,
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: screenWidth * 0.05,
                              right: screenWidth * 0.025),
                          child: Container(
                            width: screenWidth * 0.265,
                            height: screenHeight * 0.07,
                            child: ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  // Login Button - Global navigation to the main page
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: screenWidth * 0),
                                    child: ElevatedButton.icon(
                                      style: ElevatedButton.styleFrom(
                                        primary: mainColour,
                                        onPrimary: Colors.black,
                                        fixedSize: Size(screenWidth * 1,
                                            screenHeight * 0.07),
                                      ),
                                      onPressed: () {
                                        print(event.date);
                                        Add2Calendar.addEvent2Cal(
                                          buildEvent(),
                                        );
                                      },
                                      icon: FaIcon(FontAwesomeIcons.calendarAlt,
                                          color: light),
                                      label: CustomText(
                                        text: ' Add',
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
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: screenWidth * 0),
                          child: SizedBox(
                            width: screenWidth * 0.37,
                            height: screenHeight * 0.07,
                            child: Stack(
                              children: [
                                GlowAnimation(),
                                ClipRRect(
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
                                              primary: mainColour,
                                              onPrimary: Colors.black,
                                              fixedSize: Size(screenWidth * 1,
                                                  screenHeight * 0.065)),
                                          onPressed: currentUser.face == ''
                                              ? () => {
                                                    // Alert for uploading user profile picture
                                                  }
                                              : () => {
                                                    Get.offAll(
                                                        () => PurchasePage(
                                                              events: event,
                                                            ))
                                                  },
                                          icon: FaIcon(
                                              FontAwesomeIcons.shoppingBasket,
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
                        )
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
                      child: CustomText(
                          text: "Start Date " + event.date.day.toString() + "/" + event.date.month.toString()+ "/" +event.date.year.toString(),
                          size: 30,
                          color: darkGrey,
                          fontWeight: FontWeight.w300,
                          textAlign: TextAlign.center),
                    ),
                    Divider(thickness: 10,),
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: RichText(
                      text: TextSpan(children: [
                        TextSpan(
                            text: event.punchLine1 + " ",
                            style: TextStyle(
                                color: mainColour,
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                              text: "GALLERY",
                              size: 16,
                              color: darkGrey,
                              fontWeight: FontWeight.bold,
                              textAlign: TextAlign.start),
                          Divider(
                            endIndent: 20,
                            thickness: 1,
                            color: mainColour,
                          ),
                        ],
                      ),
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
                    padding: EdgeInsets.only(left: 16.0, top: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                            text: "MAP",
                            size: 16,
                            color: darkGrey,
                            fontWeight: FontWeight.bold,
                            textAlign: TextAlign.start),
                        Divider(
                          endIndent: 20,
                          thickness: 1,
                          color: mainColour,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.02,
                        vertical: screenHeight * 0.02),
                    child: SizedBox(
                      height: screenHeight * .3,
                      width: screenWidth * 1,
                      child: MapScreen(),
                    ),
                  )
                ],
              ),
            )),
      ],
    );
  }

  Future<bool> onLikeButtonTapped(bool isLiked) async {
    SnackBar snackBar = SnackBar(
      content: isLiked ? Text('Removed from Liked') : Text('Added to Liked'),
    );

// Find the ScaffoldMessenger in the widget tree
// and use it to show a SnackBar.
    ScaffoldMessenger.of(context).showSnackBar(snackBar);

    return !isLiked;
  }
}
