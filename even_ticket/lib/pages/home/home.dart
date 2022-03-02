// ignore_for_file: prefer_const_constructors

import 'package:even_ticket/app_state.dart';
import 'package:even_ticket/constants/controllers.dart';
import 'package:even_ticket/constants/style.dart';
import 'package:even_ticket/data/catagory.dart';
import 'package:even_ticket/data/event.dart';
import 'package:even_ticket/pages/home/event_details.dart';
import 'package:even_ticket/utils/responsiveness.dart';
import 'package:even_ticket/widgets/home_widgets/catagory_widget.dart';
import 'package:even_ticket/widgets/custom_assets/custom_text.dart';
import 'package:even_ticket/widgets/home_widgets/event_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class HomeViewPage extends StatelessWidget {
  const HomeViewPage({
    Key? key,
    /*required this.user*/
  }) : super(key: key);
  //final GoogleSignInAccount user;

  @override
  Widget build(BuildContext context) {
    Events event;
    return ChangeNotifierProvider<AppState>(
      create: (_) => AppState(),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Consumer<AppState>(
                  builder: (context, appstate, _) => SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        for (final category in catagories)
                          CategoryWidget(category: category)
                      ],
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Consumer<AppState>(
                  builder: (context, appstate, _) => Column(
                    children: [
                      for (event in events.where((element) => element
                          .catagoryIds
                          .contains(appstate.selectedCatagoryID)))
                        EventWidget(event: event)
                    ],
                  ),
                ),
              )
              // CircleAvatar(
              //   radius: 40,
              //   backgroundImage: NetworkImage(user.photoUrl!),
              // ),
              // SizedBox(height: 8),
              // Text(
              //   'Name: ' + user.displayName!,
              //   style: TextStyle(color: Colors.black, fontSize: 12),
              // ),
              // SizedBox(height: 8),
              // Text(
              //   'Email: ' + user.email,
              //   style: TextStyle(color: Colors.black, fontSize: 12),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
