// ignore_for_file: prefer_const_constructors

import 'package:even_ticket/constants/style.dart';
import 'package:even_ticket/utils/responsiveness.dart';
import 'package:flutter/material.dart';

// Component that renders the Top navbar
AppBar topNavBar(BuildContext context, GlobalKey<ScaffoldState> key) => AppBar(

      // Render image logo if it is not small screen, if it is render a burger menu that can open the drawer
      leading: !ResponsiveWidget.isSmallScreen(context)
          ? Row(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 13),
                  child: Image.asset(
                    "assets/icons/logo.png",
                    width: 28,
                    color: lightgreen,
                  ),
                )
              ],
            )
          : IconButton(
              icon: Icon(Icons.menu),
              color: light,
              splashRadius: 20,
              onPressed: () {
                key.currentState!.openDrawer();
              },
            ),

      // Put the tab bar on the same z coordinate as the rest of the page so it doesn't pop out
      elevation: 0,

      // Render the title of the webpage
      title: Row(
        children: [
          
  

          // Render the two icons for notifications and settings
          // Settings Icon
          Expanded(child: Container()),
          IconButton(
            splashRadius: 20,
            icon: Icon(
              Icons.settings,
              color: light,
            ),
            onPressed: () {},
          ),

          // Notifications Icon
          Stack(
            children: [
              // Actual Icon
              IconButton(
                  splashRadius: 20,
                  onPressed: () {},
                  icon: Icon(
                    Icons.notifications,
                    color: light,
                  )),

              // Red Blurb on top of Notification Icon
              Positioned(
                  top: 7,
                  right: 7,
                  child: Container(
                    width: 12,
                    height: 12,
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                        color: active,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: light, width: 2)),
                  ))
            ],
          ),
          Container(
            margin: EdgeInsets.all(10),
            width: 1,
            height: 22,
            color: lightGrey,
          ),
          SizedBox(
            width: 5,
          ),
         
          Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(30)),
            child: Container(
              padding: EdgeInsets.all(2),
              margin: EdgeInsets.all(2),
              child: CircleAvatar(
                backgroundColor: lightGrey,
                child: Icon(
                  Icons.person_outline,
                  color: darkGrey,
                ),
              ),
            ),
          ),
        ],
      ),
      iconTheme: IconThemeData(color: darkgreen),
      backgroundColor: Colors.transparent,
    );
