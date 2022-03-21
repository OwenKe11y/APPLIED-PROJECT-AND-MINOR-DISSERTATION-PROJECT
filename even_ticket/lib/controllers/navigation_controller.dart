import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

// Class that handles Navigation for the home screen and subsequent pages
class LocalNavController extends GetxController{

  static LocalNavController instance = Get.find();
  // Need a key to assign to a particular navigator so the app knows what screen we want to change to
  final GlobalKey<NavigatorState> navigationKey = GlobalKey();

  // Allows user to change screens
  Future<dynamic> navigateTo(String routeName){
    return navigationKey.currentState!.pushNamed(routeName);
  }

  // Allows user to change screens
  Future<dynamic> navigateToWithData(String routeName, Object data){
    return navigationKey.currentState!.pushNamed(routeName, arguments: data);
  }


  // Allows user to go back
  goBack() => navigationKey.currentState!.pop();
}

// Class that handles Navigation for the welcome and login pages
class LoginNavController extends GetxController{

  static LoginNavController instance = Get.find();
  // Need a key to assign to a particular navigator so the app knows what screen we want to change to
  final GlobalKey<NavigatorState> loginNavigationKey = GlobalKey();

  // Allows user to change screens
  Future<dynamic> navigateTo(String routeName){
    return loginNavigationKey.currentState!.pushNamed(routeName);
  }

  // Allows user to go back
  goBack() => loginNavigationKey.currentState!.pop();
}
