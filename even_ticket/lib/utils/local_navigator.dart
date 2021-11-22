import 'package:even_ticket/constants/controllers.dart';
import 'package:even_ticket/routing/router.dart';
import 'package:even_ticket/routing/routes.dart';
import 'package:flutter/cupertino.dart';

Navigator localNavigator() => Navigator(
  key: navigationController.navigationKey,
  initialRoute: homePageRoute,
  onGenerateRoute: generateRoute, 
  
  );