class User {
  const User(this.username, this.password, {this.token});

  final String username;
  final String? password;
  final String? token;

  factory User.fromJson(Map<String, dynamic> json) =>
      User(json['username'], json['password'], token: json['token']);
}
