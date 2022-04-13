// ignore_for_file: prefer_const_constructors

import 'package:even_ticket/app_state.dart';
import 'package:even_ticket/constants/style.dart';
import 'package:even_ticket/data/catagory.dart';
import 'package:even_ticket/data/event.dart';
import 'package:even_ticket/data/user.dart';
import 'package:even_ticket/services/http_methods.dart';
import 'package:even_ticket/utils/responsiveness.dart';
import 'package:even_ticket/widgets/home_widgets/catagory_widget.dart';
import 'package:even_ticket/widgets/event_widgets/event_widget.dart';
import 'package:even_ticket/widgets/scanner_widgets/scanner_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeViewPage extends StatefulWidget {
  const HomeViewPage({Key? key}) : super(key: key);

  @override
  State<HomeViewPage> createState() => _HomeViewPageState();
}

class _HomeViewPageState extends State<HomeViewPage> {
  @override
  void initState() {
    super.initState();

    if (mounted) {
      setState(() {
        initEvents();
        UserProfilePic.imageFile = null;
      });
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
    return ResponsiveWidget(
      largeScreen: ChangeNotifierProvider<AppState>(
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
                        const EdgeInsets.symmetric(horizontal: 500, vertical: 10),
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
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      mediumScreen: ChangeNotifierProvider<AppState>(
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
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
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
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      smallScreen: ChangeNotifierProvider<AppState>(
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
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
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
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      
    );
  }

  Future<void> _refresh() async {
    events = [];

    if (mounted) {
      await getEvents();
      setState(() {});
    }
  }

  Future<void> initEvents() async {
    if (mounted) {
      if (events.isEmpty) {
        await getEvents();
      }
      setState(() {});
    }
  }
}
