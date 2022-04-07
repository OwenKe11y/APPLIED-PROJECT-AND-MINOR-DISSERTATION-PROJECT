import 'package:even_ticket/data/catagory.dart';
import 'package:even_ticket/data/user.dart';
import 'package:even_ticket/services/http_methods.dart';
import 'package:even_ticket/widgets/home_widgets/catagory_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../app_state.dart';
import '../../constants/style.dart';
import '../../data/event.dart';
import '../../widgets/event_widgets/event_widget.dart';

class MyFavouriteViewPage extends StatefulWidget {
  const MyFavouriteViewPage({ Key? key }) : super(key: key);

  @override
  State <MyFavouriteViewPage> createState() => MyFavouriteViewPageState();
}

class MyFavouriteViewPageState extends State <MyFavouriteViewPage> {
  int counter = 0;
  @override
  void initState() {
    super.initState();

    if (mounted) {
      setState(() {
        initEvents();
      });
    }
  }
  Future<void> _refresh() async {
    events = [];

    if (mounted) {
      if (events.isEmpty) {
        await getEvents();
        await getUser(currentUser.email);
      }
      setState(() {});
    }
  }

  Future<void> initEvents() async {
    events = [];
    if (mounted) {
      if (events.isEmpty) {
        await getEvents();
        await getUser(currentUser.email);
      }
      setState(() {});
    }
  }


  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    Events event;

    if (events.isEmpty) {
      return Center(
          child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(mainColour)));
    }
    return ChangeNotifierProvider<AppState>(
      create: (_) => AppState(),
      child: SafeArea(
        child: RefreshIndicator(
          displacement: screenHeight * 0.040,
          color: mainColour,
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                  child: Consumer<AppState>(
                    builder: (context, appstate, _) => Column(
                      children: [
                        for (event in events.where((element) => currentUser.favourites.contains(element.title) && element
                            .catagoryIds
                            .contains(appstate.selectedCatagoryID)))
                          EventWidget(events: event)
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}