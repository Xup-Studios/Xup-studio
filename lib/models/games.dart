class Games {
  String name;
  String description;
  double rating;
  int reviews;
  String coverImage;

  Games(
      {required this.name,
      required this.description,
      required this.rating,
      required this.reviews,
      required this.coverImage});
}

List<Games> topgames = [
  Games(
      name: "Subway Surfers",
      description:
          "Subway Surfers is an endless runner mobile game developed by Kiloo and SYBO Games. Players take on the role of a graffiti artist who must run through subway tracks, dodging trains and obstacles while collecting coins and power-ups. The game features vibrant graphics, fast-paced gameplay, and various characters and hoverboards that players can unlock.",
      rating: 4.5,
      reviews: 20,
      coverImage: "assets/subway.jpg"),
  Games(
      name: "Crash Bandicoot",
      description:
          "Crash Bandicoot is a beloved video game character known for his orange fur, energetic personality, and high-speed platforming adventures. Created by Naughty Dog in 1996, Crash embarks on various missions to defeat villains like Doctor Neo Cortex. His games are filled with vibrant environments, challenging levels, and iconic spins.",
      rating: 4.2,
      reviews: 32,
      coverImage: "assets/crash.jpg"),
  Games(
      name: "Angry Birds",
      description:
          "Angry Birds is a popular mobile game where players use a slingshot to launch birds at structures to defeat pigs. The game features physics-based puzzles with various bird types, each with unique abilities. Released in 2009, it became a global phenomenon, spawning sequels, merchandise, and even a movie. Dive into adventure of fun and trumendous experience",
      rating: 4.7,
      reviews: 44,
      coverImage: "assets/birds.jpg")
];
