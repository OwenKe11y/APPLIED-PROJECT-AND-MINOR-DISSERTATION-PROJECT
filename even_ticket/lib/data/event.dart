class Event{
  final String imagePath, title, description, location, duration, punchLine1, punchline2;
  final List catagoryIds, galleryImages;

  Event(this.imagePath, this.title, this.description, this.location, this.duration, this.punchLine1, this.punchline2, this.catagoryIds, this.galleryImages);

  final genericConcert = Event(
  "assets/gallery/concert.jpg", 
  "Generic Concert", 
  "Insert band name here", 
  "3 Arena", 
  "4h", 
  "Concert!", 
  "Playing after 200 years of retirement", 
  [0, 1, 4], 
  ["assets/gallery/concert.jpg"]);

  final genericSport = Event(
  "assets/gallery/sports.jpg", 
  "Generic Sporting Event", 
  "Team 1 vs Team 2", 
  "Croagh Park", 
  "3h", 
  "Exciting Sports!", 
  "Will Team 1 knock out Team 2 from the tournament?", 
  [0, 3], 
  ["assets/gallery/sports.jpg"]);





}