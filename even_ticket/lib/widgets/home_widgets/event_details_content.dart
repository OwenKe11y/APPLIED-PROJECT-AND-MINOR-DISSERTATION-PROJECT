// ignore_for_file: prefer_const_constructors

import 'package:even_ticket/constants/style.dart';
import 'package:even_ticket/data/event.dart';
import 'package:even_ticket/layout.dart';
import 'package:even_ticket/widgets/custom_assets/custom_text.dart';
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

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
            SizedBox(
            height: 20,
          ),
          IconButton(onPressed: () => {Get.offAll(() => SiteLayout())}, icon: Icon(FontAwesomeIcons.windowClose), color: light,),
        
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.2, vertical: screenHeight * 0.01),
            child: CustomText(
                text: event.title,
                size: 50,
                color: light,
                fontWeight: FontWeight.bold,
                textAlign: TextAlign.end),
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.05,
              ),
              child: FittedBox(
                fit: BoxFit.fill,
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
                ),
              )),
          SizedBox(
            height: 80,
          ),
          Card(
            elevation: 10,
            color: light,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Card(
                      elevation: 10,
                      color: light,
                      child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Row(
                            
                          )))
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: RichText(
              text: TextSpan(children: [
                TextSpan(
                    text: event.punchLine1,
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
                    margin: EdgeInsets.only(left: 16, right: 16, bottom: 32),
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      child: Image(
                          image: MemoryImage(galleryImage),
                          width: 180,
                          height: 180,
                          fit: BoxFit.cover),
                    ),
                  )
              ],
            ),
          )
        ],
      ),
    );
  }
}
