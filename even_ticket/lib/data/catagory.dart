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
// Every single catagory of event
final favCata = Catagory(1, "Liked", Icons.favorite);
// Music catagory for local gigs and such
final musicCata = Catagory(2, "Music", Icons.music_note);
// Local meet ups
final meetCata = Catagory(3, "Meet Up", Icons.location_on);
// Sports events
final sportCata = Catagory(4, "Sports", Icons.sports);
// Festivals
final festivalCata = Catagory(5, "Concert", Icons.festival);

final catagories = [
  allCata,
  favCata,
  musicCata,
  meetCata,
  sportCata,
  festivalCata
];

final catagoriesSelect = [
  musicCata,
  meetCata,
  sportCata,
  festivalCata
];