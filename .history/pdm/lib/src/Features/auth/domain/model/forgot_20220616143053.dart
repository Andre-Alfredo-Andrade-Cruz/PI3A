class User {
  const User(this.email, {this.token});
  
  final String email;
  final String? token;

  factory User.fromJson(Map<String, dynamic> json) =>
      User(json['email'], token: json['token']);
}
