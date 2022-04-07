import 'package:even_ticket/data/user.dart';
import 'package:even_ticket/services/http_methods.dart';
import 'package:even_ticket/widgets/scanner_widgets/my_event_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../app_state.dart';
import '../../constants/style.dart';
import '../../data/event.dart';
import '../../widgets/event_widgets/event_widget.dart';

class MyEventPageView extends StatefulWidget {
  const MyEventPageView({ Key? key }) : super(key: key);

  @override
  State<MyEventPageView> createState() => _MyEventPageViewState();
}

class _MyEventPageViewState extends State<MyEventPageView> {
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                  child: 
                  
                  Consumer<AppState>(
                    builder: (context, appstate, _) => Column(
                      children: [
                        
                        for (event in events.where((element) => element.organiserEmail == currentUser.email))
                        MyEventWidget(events: event),
                        
                        
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