// ignore_for_file: prefer_const_constructors

import 'package:even_ticket/app_state.dart';
import 'package:even_ticket/constants/style.dart';
import 'package:even_ticket/data/catagory.dart';
import 'package:even_ticket/data/event.dart';
import 'package:even_ticket/data/ticket.dart';
import 'package:even_ticket/data/user.dart';
import 'package:even_ticket/services/http_methods.dart';
import 'package:even_ticket/widgets/home_widgets/catagory_widget.dart';
import 'package:even_ticket/widgets/event_widgets/event_widget.dart';
import 'package:even_ticket/widgets/ticket_widgets/ticket_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TicketViewPage extends StatefulWidget {
  const TicketViewPage({Key? key}) : super(key: key);

  @override
  State<TicketViewPage> createState() => _TicketViewPageState();
}

class _TicketViewPageState extends State<TicketViewPage> {
  @override
  void initState() {
    super.initState();

    if (mounted) {
      setState(() {
        initTickets();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    Ticket ticket;
    
    if (ownedTickets.isEmpty) {
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
                  child: Consumer<AppState>(
                    builder: (context, appstate, _) => Column(
                      children: [
                        for (ticket in ownedTickets.where((element) => element.owner == currentUser.name))
                          TicketWidget(tickets: ticket)
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

  Future<void> _refresh() async {
    ownedTickets = [];

    if (mounted) {
      await getTickets(currentUser.name);
      setState(() {});
    }
  }

  Future<void> initTickets() async {
    if (mounted) {
      if (ownedTickets.isEmpty) {
         await getTickets(currentUser.name).then((value) => print(ownedTickets));
      }
      setState(() {});
    }
  }
}