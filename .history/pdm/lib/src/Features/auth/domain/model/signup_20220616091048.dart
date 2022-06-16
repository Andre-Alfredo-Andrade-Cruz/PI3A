class User {
  const User(this.username, this.email, this.birth, this.password,
      this.confirmPassword,
      {this.token});

  final String username;
  final String email;
  final String password;
  final String? token;
  final String birth;
  final String confirmPassword;

  factory User.fromJson(Map<String, dynamic> json) => User(json['username'],
      json['email'], json['birth'], json['password'], json['confirmPassword'],
      token: json['token']);
}
