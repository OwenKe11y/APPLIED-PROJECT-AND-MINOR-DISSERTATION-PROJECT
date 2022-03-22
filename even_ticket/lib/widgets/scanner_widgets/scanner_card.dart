import 'dart:io';

import 'package:even_ticket/widgets/custom_assets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../constants/style.dart';

class ScannerCard extends StatefulWidget {
  const ScannerCard({Key? key}) : super(key: key);

  @override
  State<ScannerCard> createState() => _ScannerCardState();
}

class _ScannerCardState extends State<ScannerCard> {
  File? imageFile;

  /// Get from Camera
  _getFromCamera() async {
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
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
                          primary: darkgreen,
                          onPrimary: light,
                          minimumSize: Size(double.infinity, 50),
                        ),
                        onPressed: () {
                          _getFromCamera();
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
                    children: [_imageSection()],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _imageSection() {
    return (imageFile == null)
        ? Container(
            alignment: Alignment.center,
            child: CustomText(
                text: "No Image selected for comparison",
                size: 24,
                color: lightGrey,
                fontWeight: FontWeight.bold,
                textAlign: TextAlign.center))
        : Image.file(
            imageFile!,
            fit: BoxFit.cover,
          );
  }
}
