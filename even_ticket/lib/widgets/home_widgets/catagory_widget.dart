// ignore_for_file: unused_import, prefer_const_constructors

import 'package:even_ticket/app_state.dart';
import 'package:even_ticket/constants/style.dart';
import 'package:even_ticket/data/catagory.dart';
import 'package:even_ticket/widgets/custom_assets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryWidget extends StatelessWidget {
  final Catagory category;


  const CategoryWidget({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appstate = Provider.of<AppState>(context);
    final isSelected = appstate.selectedCatagoryID == category.catagoryId;

    return GestureDetector(
      onTap: () => {
       
        appstate.displayCatagoryID(category.catagoryId)
        
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        width: 90,
        height: 90,
        decoration: BoxDecoration(
          border: Border.all(color: isSelected ? Colors.transparent : light, width: 3),
          borderRadius: BorderRadius.all(Radius.circular(16)),
          color: isSelected ? light : Colors.transparent,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              category.icon,
              color: isSelected ? darkgreen : light,
              size: 40,
            ),
            CustomText(
                text: category.name,
                size: 16,
                color: isSelected ?  darkgreen: light,
                fontWeight: FontWeight.bold, textAlign: TextAlign.center,)
          ],
        ),
      ),
    );
  }
}

class CategoryWidgetGen extends StatelessWidget {
  final Catagory category;


  const CategoryWidgetGen({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appstate = Provider.of<AppState>(context);
    bool isSelected = appstate.cataList.contains(category.catagoryId);

    return GestureDetector(
      onTap: () => {
        if(!isSelected){
          appstate.updateCatagoryID(category.catagoryId),
          
          
        }
        else if(isSelected){
          appstate.deleteCatagoryID(category.catagoryId),
        },
        
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        width: 90,
        height: 90,
        decoration: BoxDecoration(
          border: Border.all(color: isSelected ? light : darkgreen, width: 3),
          borderRadius: BorderRadius.all(Radius.circular(16)),
          color: isSelected ? darkgreen : Colors.transparent,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              category.icon,
              color: isSelected ? light : darkgreen,
              size: 40,
            ),
            CustomText(
                text: category.name,
                size: 16,
                color: isSelected ? light : darkgreen,
                fontWeight: FontWeight.bold, textAlign: TextAlign.center,)
          ],
        ),
      ),
    );
  }
}
