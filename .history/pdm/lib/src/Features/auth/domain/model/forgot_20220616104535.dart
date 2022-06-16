class User {
  const User(this.email, {this.token});

  // final String name;
  // final String username;
  final String email;
  final String? token;

  factory User.fromJson(Map<String, dynamic> json) =>
      User(json['name'], json['username'], token: json['token']);
}
