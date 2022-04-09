class User {
  const User(this.name, this.username, {this.token});

  final String name;
  final String username;
  final String? token;

  factory User.fromJson(Map<String, dynamic> json) =>
      User(json['name'], json['username'], token: json['token']);
}
