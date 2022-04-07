// ignore_for_file: unused_import

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Catagory {
  final int catagoryId;
  final String name;
  final IconData icon;

  Catagory(this.catagoryId, this.name, this.icon);
}

// Every single catagory of event
final allCata = Catagory(0, "All", Icons.search);
// Music catagory for local gigs and such
final musicCata = Catagory(1, "Music", Icons.music_note);
// Local meet ups
final meetCata = Catagory(2, "Meet Up", Icons.people_alt_sharp);
// Sports events
final sportCata = Catagory(3, "Sports", Icons.sports);
// Festivals
final festivalCata = Catagory(4, "Creative", Icons.brush_sharp);

final catagories = [
  allCata,
  musicCata,
  meetCata,
  sportCata,
  festivalCata
];

final catagoriesSelect = [musicCata, meetCata, sportCata, festivalCata];
