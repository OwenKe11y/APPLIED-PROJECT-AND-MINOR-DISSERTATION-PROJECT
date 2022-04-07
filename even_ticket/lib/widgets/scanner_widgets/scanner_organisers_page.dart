import 'package:camera/camera.dart';
import 'package:even_ticket/widgets/scanner_widgets/scanner_organiser_card.dart';
import 'package:flutter/material.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'painters/face_detector_painter.dart';

class ButtonState {
  static bool buttonActive = false;
}

class FaceDetectorView extends StatefulWidget {
  @override
  _FaceDetectorViewState createState() => _FaceDetectorViewState();
}

class _FaceDetectorViewState extends State<FaceDetectorView> {
  FaceDetector faceDetector = GoogleMlKit.vision.faceDetector();
  bool isBusy = false;
  CustomPaint? customPaint;

  @override
  void dispose() {
    faceDetector.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CameraView(
      onImage: (inputImage) {
        processImage(inputImage);
      },
      initialDirection: CameraLensDirection.back,
    );
  }

  Future<void> processImage(InputImage inputImage) async {
    if (isBusy) return;
    isBusy = true;
    final faces = await faceDetector.processImage(inputImage);
    print('Found ${faces.length} faces');
    if (faces.length == 1) {
      ButtonState.buttonActive = true;
    }
    if (faces.length > 1) {
      _showMyDialog(true);
      ButtonState.buttonActive = false;
    } else if (faces.length == 0) {
      _showMyDialog(false);
      ButtonState.buttonActive = false;
    }

    isBusy = false;
    if (mounted) {
      setState(() {});
    }
  }

  Future<void> _showMyDialog(bool faceDetected) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Error'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                faceDetected
                    ? Text('Detected more than one face, please try again.')
                    : Text('No face detected, please try again.'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
