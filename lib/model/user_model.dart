class User {
  String username;
  String token;

  User({required this.username, required this.token});

  factory User.fromJson(Map<String, dynamic> json) =>
      User(username: json['username'], token: json['token'] ?? 'token');
}
