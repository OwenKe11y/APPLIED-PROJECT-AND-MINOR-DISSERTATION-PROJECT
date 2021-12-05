// ignore_for_file: prefer_const_constructors

import 'package:even_ticket/constants/style.dart';
import 'package:even_ticket/utils/responsiveness.dart';
import 'package:even_ticket/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

AppBar topNavBar(BuildContext context, GlobalKey<ScaffoldState> key) => AppBar(
      leading: !ResponsiveWidget.isSmallScreen(context)
          ? Row(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 14),
                  child: Image.asset(
                    "assets/icons/logo.png",
                    width: 28,
                  ),
                )
              ],
            )
          : IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                key.currentState!.openDrawer();
              },
            ),
      elevation: 0,
      title: Row(
        children: [
          Visibility(
              child: CustomText(
            text: "EvenTicket",
            color: lightGrey,
            size: 20,
            fontWeight: FontWeight.bold,
          )),
          Expanded(child: Container()),
          IconButton(
            splashRadius: 22,
            icon: Icon(
              Icons.settings,
              color: dark.withOpacity(.7),
            ),
            onPressed: () {},
          ),
          Stack(
            children: [
              IconButton(
                  splashRadius: 22,
                  onPressed: () {},
                  icon: Icon(
                    Icons.notifications,
                    color: dark.withOpacity(.7),
                  )),
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
            width: 24,
          ),
          CustomText(
              text: "Owen Kelly",
              color: lightGrey,
              size: 15,
              fontWeight: FontWeight.bold),
          SizedBox(
            width: 16,
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(30)),
            child: Container(
              padding: EdgeInsets.all(4),
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
      iconTheme: IconThemeData(color: dark),
      backgroundColor: darkGrey,
    );
