import 'dart:io';

import 'package:even_ticket/constants/controllers.dart';
import 'package:even_ticket/data/user.dart';
import 'package:even_ticket/routing/routes.dart';
import 'package:even_ticket/widgets/scanner_widgets/scanner_card.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../constants/style.dart';
import '../custom_assets/custom_text.dart';

class SettingsCard extends StatefulWidget {
  const SettingsCard({Key? key}) : super(key: key);

  @override
  State<SettingsCard> createState() => _SettingsCardState();
}

class _SettingsCardState extends State<SettingsCard> {
  File? imageFile = UserProfilePic.imageFile;
  final usernameController = TextEditingController();
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
        : CircleAvatar(
            backgroundColor: light,
            maxRadius: 90,
            child: ClipOval(
              child: Image.file(
                imageFile!,
                fit: BoxFit.cover,
                width: 150.0,
                height: 150.0,
              ),
            ));
  }
    Widget _title() {
    return (usernameController.text.isEmpty)
        ? CustomText(
            text: currentUser.name,
            size: 30,
            color: darkGrey,
            fontWeight: FontWeight.bold,
            textAlign: TextAlign.center)
        : CustomText(
            text: usernameController.text,
            size: 30,
            color: darkGrey,
            fontWeight: FontWeight.bold,
            textAlign: TextAlign.center);
  }
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        child: Container(
       
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

        Card(
        elevation: 10,
        color: light,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                child: _title()
              ),
            ],
          ),
        ),
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
                    // Event title Field
                          TextFormField(
                            keyboardType: TextInputType.multiline,
                            maxLength: 15,
                        
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter a title';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              labelText: "Username",
                              
                            ),
                            controller: usernameController,
                          ),
                    SizedBox(
                      height: 50,
                    ),
                    Row(
                      children: const [
                        CustomText(
                          text: "Profile Picture",
                          size: 14,
                          color: Color.fromARGB(255, 117, 112, 112),
                          fontWeight: FontWeight.w100,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
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
      ),
      const Spacer(),
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
                        //ENDAS CODES GOES HERE
                        localNavController.navigateTo(homePageRoute);
                      },
                      child: Text("UPLOAD"),
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
