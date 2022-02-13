class Event {
  final String imagePath,
      title,
      description,
      location,
      duration,
      punchLine1,
      punchline2;
  final List catagoryIds, galleryImages;

  Event(
      {required this.imagePath,
      required this.title,
      required this.description,
      required this.location,
      required this.duration,
      required this.punchLine1,
      required this.punchline2,
      required this.catagoryIds,
      required this.galleryImages});
}

  final genericConcert = Event(
      imagePath: 'assets/gallery/concert.jpg',
      title: "Generic Concert",
      description: "Insert band name here",
      location: "3 Arena",
      duration: "4h",
      punchLine1: "Concert!",
      punchline2: "Playing after 200 years of retirement",
      catagoryIds: [0, 1, 4],
      galleryImages: ["assets/gallery/concert.jpg"]);

  final genericSport = Event(
      imagePath: 'assets/gallery/sports.jpg',
      title: "Generic Sporting Event",
      description: "Team 1 vs Team 2",
      location: "Croagh Park",
      duration: "3h",
      punchLine1: "Exciting Sports!",
      punchline2: "Will Team 1 knock out Team 2 from the tournament?",
      catagoryIds: [0, 3],
      galleryImages: ["assets/gallery/sports.jpg"]);
  
  final genericBleh = Event(
      imagePath: 'assets/gallery/sports.jpg',
      title: "PEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEYAAAAAAAAAAA",
      description: "Team 1 vs Team 2",
      location: "Croagh Park",
      duration: "3h",
      punchLine1: "Exciting Sports!",
      punchline2: "Will Team 1 knock out Team 2 from the tournament?",
      catagoryIds: [0, 3],
      galleryImages: ["assets/gallery/sports.jpg"]);

  final events = [genericConcert, genericSport, genericBleh];

