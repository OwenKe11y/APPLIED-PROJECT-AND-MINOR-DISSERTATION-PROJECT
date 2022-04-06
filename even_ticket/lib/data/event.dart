import 'dart:typed_data';

class Events {
  final String title,
      description,
      price,
      location,
      time,
      punchLine1,
      punchline2;
  final DateTime date;
  final Uint8List displayImage;
  final List catagoryIds, galleryImages;
  final String organiserEmail;
  final int amount;

  Events(
      {required this.title,
      required this.description,
      required this.price,
      required this.location,
      required this.time,
      required this.punchLine1,
      required this.punchline2,
      required this.date,
      required this.displayImage,
      required this.catagoryIds,
      required this.galleryImages,
      required this.organiserEmail,
      required this.amount});
}

var events = [];
