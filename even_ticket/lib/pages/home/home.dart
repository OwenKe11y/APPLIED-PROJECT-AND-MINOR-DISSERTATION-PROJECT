// ignore_for_file: prefer_const_constructors

import 'package:even_ticket/constants/controllers.dart';
import 'package:even_ticket/constants/style.dart';
import 'package:even_ticket/data/catagory.dart';
import 'package:even_ticket/utils/responsiveness.dart';
import 'package:even_ticket/widgets/catagory_widget.dart';
import 'package:even_ticket/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class HomeViewPage extends StatelessWidget {
  //const HomeViewPage({Key? key}) : super(key: key);
  final GoogleSignInAccount user;

  HomeViewPage({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Obx(() => Row(children: [
                Container(
                  margin: EdgeInsets.only(
                    top: ResponsiveWidget.isSmallScreen(context) ? 42 : 6,
                    left: ResponsiveWidget.isSmallScreen(context) ? 50 : 6,
                  ),
                  child: CustomText(
                      text: menuController.activeItem.value,
                      size: 25,
                      color: lightGrey,
                      fontWeight: FontWeight.bold),
                ),
              ])),
          Padding(padding: EdgeInsets.all(16)),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                for (final category in catagories)
                  CategoryWidget(category: category)
              ],
            ),
          ),
          CircleAvatar(
            radius: 40,
            backgroundImage: NetworkImage(user.photoUrl!),
          ),
          SizedBox(height: 8),
          Text(
            'Name: ' + user.displayName!,
            style: TextStyle(color: Colors.black, fontSize: 12),
          ),
          SizedBox(height: 8),
          Text(
            'Email: ' + user.email,
            style: TextStyle(color: Colors.black, fontSize: 12),
          )
        ],
      ),
    );
  }
}
