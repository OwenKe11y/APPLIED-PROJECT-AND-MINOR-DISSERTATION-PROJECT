
import 'package:get/get.dart';

// Every single value that is meant to be observed must be made into 
// an observable
class CounterController extends GetxController{
  var counter = 0.obs; //counter was turned into an observable

  void increment(){
    counter++;
  }
  
}