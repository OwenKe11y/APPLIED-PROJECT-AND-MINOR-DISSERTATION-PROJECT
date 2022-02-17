import 'package:flutter/material.dart';

class Event {
  final Image displayImage;
  final String title, description, location, duration, punchLine1, punchline2;
  final List catagoryIds, galleryImages;

  Event(
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

final events = [];
