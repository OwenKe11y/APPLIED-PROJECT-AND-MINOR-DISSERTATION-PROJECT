class User {
  final String name;
  final String email;
  final String password;
  final String password2;

  const User({required this.name, required this.email, required this.password, required this.password2});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      email: json['email'],
      password: json['password'],
      password2: json['password2'],
    );
  }
}