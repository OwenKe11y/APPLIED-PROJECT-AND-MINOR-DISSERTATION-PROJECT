class User {
  final String name;
  final String email;
  final String password;
  final List<dynamic> favourites;
  final bool isOrganiser;
  final String face;

  const User(
      {required this.name,
      required this.email,
      required this.password,
      required this.favourites,
      required this.isOrganiser,
      required this.face});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      email: json['email'],
      password: json['password'],
      favourites: json['favourites'],
      isOrganiser: json['isOrganiser'],
      face: '',
    );
  }
}

var currentUser;
