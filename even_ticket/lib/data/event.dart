import 'dart:typed_data';

class Events {
  final Uint8List displayImage;
  final String title, description, location, duration, punchLine1, punchline2;
  final List catagoryIds, galleryImages;

  Events(
      {required this.displayImage,
      required this.title,
      required this.description,
      required this.location,
      required this.duration,
      required this.punchLine1,
      required this.punchline2,
      required this.catagoryIds,
      required this.galleryImages});
}

var events = [];
