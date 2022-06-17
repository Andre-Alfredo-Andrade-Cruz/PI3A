class User {
  const User(
      this.name, this.username, this.birth, this.password, this.confirmPassword,
      {this.token});

  final String name;
  final String username;
  final String? password;
  final String? token;
  final String? birth;
  final String? confirmPassword;

  factory User.fromJson(Map<String, dynamic> json) => User(
      json['name'],
      json['username'],
      json['birth'],
      json['password'],
      json['confirmPassword'],
      token: json['token']);
}
