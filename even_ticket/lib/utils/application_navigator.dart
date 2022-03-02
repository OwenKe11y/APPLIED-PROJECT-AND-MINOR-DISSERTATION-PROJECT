import 'package:even_ticket/constants/controllers.dart';
import 'package:even_ticket/routing/router.dart';
import 'package:even_ticket/routing/routes.dart';
import 'package:flutter/cupertino.dart';

// Navigator and key for accessing the pages for the main app like the home page etc.
Navigator localNavigator() => Navigator(
  key: localNavController.navigationKey,
  initialRoute: homePageRoute,
  onGenerateRoute: generateRoute, 
  );

// Navigator and key for accessing the login auth pages.
Navigator loginNavigator() => Navigator(
  key: loginNavController.loginNavigationKey,
  initialRoute: authenticationPageRoute,
  onGenerateRoute: generateRoute, 
  );
