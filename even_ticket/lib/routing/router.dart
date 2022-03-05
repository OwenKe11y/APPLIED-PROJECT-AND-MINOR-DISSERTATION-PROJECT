// ignore_for_file: prefer_const_constructors

import 'package:even_ticket/data/event.dart';
import 'package:even_ticket/pages/authentication/login_page.dart';
import 'package:even_ticket/pages/authentication/register_page.dart';
import 'package:even_ticket/pages/authentication/welcome_page.dart';
import 'package:even_ticket/pages/event%20generation/event_generation.dart';
import 'package:even_ticket/pages/home/event_details.dart';
import 'package:even_ticket/routing/routes.dart';
import 'package:even_ticket/pages/home/home.dart';
import 'package:even_ticket/pages/settings/settings.dart';
import 'package:even_ticket/pages/tickets/tickets.dart';
import 'package:flutter/material.dart';
import '../../pages/home/event_details.dart';

// All routes for every page of the app goes into this switch statement
Route<dynamic> generateRoute(RouteSettings settings) {
  final args = settings.arguments;

  switch (settings.name) {
    case homePageRoute:
      return _pageRoute(HomeViewPage());
    case ticketsPageRoute:
      return _pageRoute(TicketViewPage());
    case eventGenerationPageRoute:
      return _pageRoute(EventGenerationPage());
    case settingsPageRoute:
      return _pageRoute(SettingsViewPage());
    case detailsRoute:
      if (args is Events) {
        return _pageRoute(EventDetail(events: args));
      }
      return _pageRoute(HomeViewPage());
    case authenticationPageRoute:
      return _pageRoute(WelcomePage());
    case loginRoute:
      return _pageRoute(LoginPage());
    case registerRoute:
      return _pageRoute(RegisterPage());
    default:
      return _pageRoute(HomeViewPage());
  }
}

PageRoute _pageRoute(Widget child) {
  return MaterialPageRoute(builder: (context) => (child));
}
