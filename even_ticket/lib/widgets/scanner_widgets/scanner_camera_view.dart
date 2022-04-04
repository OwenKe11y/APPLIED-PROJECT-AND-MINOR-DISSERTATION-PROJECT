// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:image_picker/image_picker.dart';

import '../../constants/style.dart';
import '../../main.dart';

enum ScreenMode { liveFeed, gallery }

class CameraView extends StatefulWidget {
  const CameraView(
      {Key? key,
      required this.onImage,
      this.initialDirection = CameraLensDirection.back})
      : super(key: key);

  final Function(InputImage inputImage) onImage;
  final CameraLensDirection initialDirection;

  @override
  _ScannerCameraViewState createState() => _ScannerCameraViewState();
}

class _ScannerCameraViewState extends State<CameraView> {
  //ScreenMode _mode = ScreenMode.gallery;
  //CameraController? _controller;
  File? _image;
  ImagePicker? _imagePicker;
  //int _cameraIndex = 0;
  double zoomLevel = 0.0, minZoomLevel = 0.0, maxZoomLevel = 0.0;

  @override
  void initState() {
    super.initState();

    _imagePicker = ImagePicker();

    // if (cameras.any(
    //   (element) =>
    //       element.lensDirection == widget.initialDirection &&
    //       element.sensorOrientation == 90,
    // )) {
    //   _cameraIndex = cameras.indexOf(
    //     cameras.firstWhere((element) =>
    //         element.lensDirection == widget.initialDirection &&
    //         element.sensorOrientation == 90),
    //   );
    // } else {
    //   _cameraIndex = cameras.indexOf(
    //     cameras.firstWhere(
    //       (element) => element.lensDirection == widget.initialDirection,
    //     ),
    //   );
    // }

    //_startLiveFeed();
  }

  @override
  void dispose() {
    //_stopLiveFeed();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(children: [
      Card(
        margin: EdgeInsets.symmetric(vertical: 25),
        elevation: 4,
        color: light,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(24))),
        child: _galleryBody(),
      )
    ]));
  }

  Widget _galleryBody() {
    return ListView(shrinkWrap: true, children: [
      _image != null
          ? Container(
              height: 400,
              width: 400,
              child: Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  Image.file(_image!),
                ],
              ),
            )
          : Icon(
              Icons.image,
              size: 200,
            ),
      // Padding(
      //   padding: EdgeInsets.symmetric(horizontal: 15, vertical: 16),
      //   child: ElevatedButton(
      //     style: ElevatedButton.styleFrom(
      //       primary: darkgreen,
      //       onPrimary: light,
      //       minimumSize: Size(double.infinity, 50),
      //     ),
      //     child: Text('From Gallery'),
      //     onPressed: () => _getImage(ImageSource.gallery),
      //   ),
      // ),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: mainColour,
            onPrimary: light,
            minimumSize: Size(double.infinity, 50),
          ),
          child: Text('Take a picture'),
          onPressed: () => _getImage(ImageSource.camera),
        ),
      ),
    ]);
  }

  Future _getImage(ImageSource source) async {
    final pickedFile = await _imagePicker?.getImage(source: source);
    if (pickedFile != null) {
      //_startLiveFeed();
      _processPickedFile(pickedFile);
    } else {
      print('No image selected.');
    }
    setState(() {});
  }

  Future _processPickedFile(PickedFile pickedFile) async {
    setState(() {
      _image = File(pickedFile.path);
    });
    final inputImage = InputImage.fromFilePath(pickedFile.path);
    widget.onImage(inputImage);
  }

  // Widget? _floatingActionButton() {
  //   if (_mode == ScreenMode.gallery) return null;
  //   if (cameras.length == 1) return null;
  //   return Container(
  //       height: 70.0,
  //       width: 70.0,
  //       child: FloatingActionButton(
  //         child: Icon(
  //           Platform.isIOS
  //               ? Icons.flip_camera_ios_outlined
  //               : Icons.flip_camera_android_outlined,
  //           size: 40,
  //         ),
  //         onPressed: _switchLiveCamera,
  //       ));
  // }

  // Widget _body() {
  //   Widget body;
  //   if (_mode == ScreenMode.liveFeed)
  //     body = _liveFeedBody();
  //   else
  //     body = _galleryBody();
  //   return body;
  // }

  // Widget _liveFeedBody() {
  //   if (_controller?.value.isInitialized == false) {
  //     return Container();
  //   }

  //   final size = MediaQuery.of(context).size;
  //   // calculate scale depending on screen and camera ratios
  //   // this is actually size.aspectRatio / (1 / camera.aspectRatio)
  //   // because camera preview size is received as landscape
  //   // but we're calculating for portrait orientation
  //   var scale = size.aspectRatio * _controller!.value.aspectRatio;

  //   // to prevent scaling down, invert the value
  //   if (scale < 1) scale = 1 / scale;

  //   return Container(
  //     color: Colors.black,
  //     child: Stack(
  //       fit: StackFit.expand,
  //       children: <Widget>[
  //         Transform.scale(
  //           scale: scale,
  //           child: Center(
  //             child: CameraPreview(_controller!),
  //           ),
  //         ),
  //         if (widget.customPaint != null) widget.customPaint!,
  //         Positioned(
  //           bottom: 100,
  //           left: 50,
  //           right: 50,
  //           child: Slider(
  //             value: zoomLevel,
  //             min: minZoomLevel,
  //             max: maxZoomLevel,
  //             onChanged: (newSliderValue) {
  //               setState(() {
  //                 zoomLevel = newSliderValue;
  //                 _controller!.setZoomLevel(zoomLevel);
  //               });
  //             },
  //             divisions: (maxZoomLevel - 1).toInt() < 1
  //                 ? null
  //                 : (maxZoomLevel - 1).toInt(),
  //           ),
  //         )
  //       ],
  //     ),
  //   );
  // }

  // void _switchScreenMode() async {
  //   if (_mode == ScreenMode.liveFeed) {
  //     _mode = ScreenMode.gallery;
  //     await _stopLiveFeed();
  //   } else {
  //     _mode = ScreenMode.liveFeed;
  //     await _startLiveFeed();
  //   }
  //   setState(() {});
  // }

  // Future _startLiveFeed() async {
  //   final camera = cameras[_cameraIndex];
  //   _controller = CameraController(
  //     camera,
  //     ResolutionPreset.high,
  //     enableAudio: false,
  //   );
  //   _controller?.initialize().then((_) {
  //     if (!mounted) {
  //       return;
  //     }
  //     _controller?.getMinZoomLevel().then((value) {
  //       zoomLevel = value;
  //       minZoomLevel = value;
  //     });
  //     _controller?.getMaxZoomLevel().then((value) {
  //       maxZoomLevel = value;
  //     });
  //     _controller?.startImageStream(_processCameraImage);
  //     setState(() {});
  //   });
  // }

  // Future _stopLiveFeed() async {
  //   await _controller?.stopImageStream();
  //   await _controller?.dispose();
  //   _controller = null;
  // }

  // Future _switchLiveCamera() async {
  //   if (cameras.length > _cameraIndex) {
  //     _cameraIndex++;
  //   } else {
  //     _cameraIndex = 0;
  //   }

  //   await _stopLiveFeed();
  //   await _startLiveFeed();
  // }

  // Future _processCameraImage(CameraImage image) async {
  //   final WriteBuffer allBytes = WriteBuffer();
  //   for (Plane plane in image.planes) {
  //     allBytes.putUint8List(plane.bytes);
  //   }
  //   final bytes = allBytes.done().buffer.asUint8List();

  //   final Size imageSize =
  //       Size(image.width.toDouble(), image.height.toDouble());

  //   final camera = cameras[_cameraIndex];
  //   final imageRotation =
  //       InputImageRotationMethods.fromRawValue(camera.sensorOrientation) ??
  //           InputImageRotation.Rotation_0deg;

  //   final inputImageFormat =
  //       InputImageFormatMethods.fromRawValue(image.format.raw) ??
  //           InputImageFormat.NV21;

  //   final planeData = image.planes.map(
  //     (Plane plane) {
  //       return InputImagePlaneMetadata(
  //         bytesPerRow: plane.bytesPerRow,
  //         height: plane.height,
  //         width: plane.width,
  //       );
  //     },
  //   ).toList();

  //   final inputImageData = InputImageData(
  //     size: imageSize,
  //     imageRotation: imageRotation,
  //     inputImageFormat: inputImageFormat,
  //     planeData: planeData,
  //   );

  //   final inputImage =
  //       InputImage.fromBytes(bytes: bytes, inputImageData: inputImageData);

  //   widget.onImage(inputImage);
  // }
}
