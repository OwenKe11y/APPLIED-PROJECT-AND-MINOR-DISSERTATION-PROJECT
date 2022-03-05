// ignore_for_file: prefer_const_constructors

import 'package:even_ticket/app_state.dart';
import 'package:even_ticket/constants/controllers.dart';
import 'package:even_ticket/constants/style.dart';
import 'package:even_ticket/data/catagory.dart';
import 'package:even_ticket/data/event.dart';
import 'package:even_ticket/pages/home/event_details.dart';
import 'package:even_ticket/services/http_methods.dart';
import 'package:even_ticket/utils/responsiveness.dart';
import 'package:even_ticket/widgets/home_widgets/catagory_widget.dart';
import 'package:even_ticket/widgets/custom_assets/custom_text.dart';
import 'package:even_ticket/widgets/home_widgets/event_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class HomeViewPage extends StatefulWidget {
  const HomeViewPage({ Key? key }) : super(key: key);

  @override
  State<HomeViewPage> createState() => _HomeViewPageState();
}

class _HomeViewPageState extends State<HomeViewPage> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    Events event;
    return ChangeNotifierProvider<AppState>(
      create: (_) => AppState(),
      child: SafeArea(
        child: RefreshIndicator(
          displacement: screenHeight * 0.040,
          color: darkgreen,
          onRefresh: _refresh,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
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
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                  child: Consumer<AppState>(
                    builder: (context, appstate, _) => Column(
                      children: [
                        for (event in events.where((element) => element
                            .catagoryIds
                            .contains(appstate.selectedCatagoryID)))
                          EventWidget(events: event)
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
      ),
    );
  }
  Future<void> _refresh() async {
    events = [];
    await getEvents();
    setState(() {});
    
  }
}
