import 'dart:js';

import 'package:even_ticket/routing/routes.dart';
import 'package:even_ticket/pages/calender/calender.dart';
import 'package:even_ticket/pages/home/home.dart';
import 'package:even_ticket/pages/maps/maps.dart';
import 'package:even_ticket/pages/settings/settings.dart';
import 'package:even_ticket/pages/tickets/tickets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case homePageRoute:
      return _pageRoute(HomeViewPage());
    case ticketsPageRoute:
      return _pageRoute(TicketViewPage());
    case calenderPageRoute:
      return _pageRoute(CalenderViewPage());
    case mapsPageRoute:
      return _pageRoute(MapsViewPage());
    case settingsPageRoute:
      return _pageRoute(SettingsViewPage());
    default:
      return _pageRoute(HomeViewPage());
  }
}

PageRoute _pageRoute(Widget child) {
  return MaterialPageRoute(builder: (context) => (child));
}
