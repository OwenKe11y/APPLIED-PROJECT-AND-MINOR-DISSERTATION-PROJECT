import 'dart:io';

import 'package:even_ticket/constants/controllers.dart';
import 'package:even_ticket/data/user.dart';
import 'package:even_ticket/routing/routes.dart';
import 'package:even_ticket/widgets/scanner_widgets/scanner_card.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../constants/style.dart';

class SettingsCard extends StatefulWidget {
  const SettingsCard({Key? key}) : super(key: key);

  @override
  State<SettingsCard> createState() => _SettingsCardState();
}

class _SettingsCardState extends State<SettingsCard> {
  File? imageFile = UserProfilePic.imageFile;

  Widget _imageSection() {
    return (imageFile == null)
        ? CircleAvatar(
            backgroundColor: lightGrey,
            maxRadius: 100,
            child: Icon(
              Icons.person_outline,
              color: darkGrey,
            ),
          )
        : 
        
          CircleAvatar(
            backgroundColor: light,
            maxRadius: 120,
            child: ClipOval(
              
              child: Image.file(

            imageFile!,
            fit: BoxFit.cover,
            width: 200.0,
            height: 200.0,
          ),
            )
          );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        child: Container(
            padding: EdgeInsets.all(1),
            margin: EdgeInsets.all(2),
            child: currentUser.face == null
                ? CircleAvatar(
                    backgroundColor: lightGrey,
                    maxRadius: 100,
                    child: Icon(
                      Icons.person_outline,
                      color: darkGrey,
                    ),
                  )
                : _imageSection()),
      ),
      SizedBox(
        height: screenHeight * 0.04,
      ),
      Card(
        elevation: 10,
        color: light,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ClipRRect(
                child: Column(
                  children: [
                    // Divider
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: mainColour,
                        onPrimary: light,
                        minimumSize: Size(double.infinity, 50),
                      ),
                      onPressed: () {
                        localNavController.navigateTo(userScannerPageRoute);
                      },
                      child: Text("PICK FROM CAMERA"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      )
    ]);
  }
}
