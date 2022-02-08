import 'package:even_ticket/constants/controllers.dart';
import 'package:even_ticket/routing/router.dart';
import 'package:even_ticket/routing/routes.dart';
import 'package:flutter/cupertino.dart';

Navigator splashNavigator() => Navigator(
  key: navigationController.navigationKey,
  initialRoute: homePageRoute,
  onGenerateRoute: splashRoutes, 
  
  );