class User {
  const User(this.name, this.birth, this.username, this.password, this.confirm_password, {this.token});

  final String name;
  final String birth;
  final String username;
  final String password;
  final String confirm_password;
  final String? token;

  factory User.fromJson(Map<String, dynamic> json) =>
      User(json['name'], json['birth'], json['username'], json['password'], json['confirm_password'], token: json['token']);
}
