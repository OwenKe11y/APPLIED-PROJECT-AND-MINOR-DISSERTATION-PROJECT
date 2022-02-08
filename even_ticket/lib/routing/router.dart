import 'package:even_ticket/pages/authentication/login_page.dart';
import 'package:even_ticket/pages/authentication/register_page.dart';
import 'package:even_ticket/pages/authentication/welcome_page.dart';
import 'package:even_ticket/routing/routes.dart';
import 'package:even_ticket/pages/calender/calender.dart';
import 'package:even_ticket/pages/home/home.dart';
import 'package:even_ticket/pages/maps/maps.dart';
import 'package:even_ticket/pages/settings/settings.dart';
import 'package:even_ticket/pages/tickets/tickets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Route<dynamic> dashRoutes(RouteSettings settings) {
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
    case welcomeRoute:
    default:
      return _pageRoute(HomeViewPage());
  }
}
Route<dynamic> splashRoutes(RouteSettings settings) {
  switch (settings.name) {
    case welcomeRoute:
      return _pageRoute(WelcomePage());
    case loginRoute:
      return _pageRoute(LoginPage());
    case registerRoute:
      return _pageRoute(RegisterPage());
    default:
      return _pageRoute(WelcomePage());
  }
}

PageRoute _pageRoute(Widget child) {
  return MaterialPageRoute(builder: (context) => (child));
}
