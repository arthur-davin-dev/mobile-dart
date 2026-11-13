class User {
  final String name;
  final String username;
  final String email;

  const User({
    required this.name,
    required this.username,
    required this.email,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        name: json['name'] as String,
        username: json['username'] as String,
        email: json['email'] as String,
      );
}