import 'package:flutter/cupertino.dart';

class AppState extends ChangeNotifier {
  int selectedCatagoryID = 0;
  List cataList = [];
  void updateCatagoryID(int selectedCatagoryID) {
    this.selectedCatagoryID = selectedCatagoryID;
    if (cataList.contains(selectedCatagoryID)) {
      print("Already Exits");
    } else {
      cataList.add(selectedCatagoryID);
    }
    print(cataList);
    notifyListeners();
  }

  void deleteCatagoryID(int selectedCatagoryID) {
    this.selectedCatagoryID = selectedCatagoryID;
    cataList.remove(selectedCatagoryID);
    print(cataList);
    notifyListeners();
  }
}
