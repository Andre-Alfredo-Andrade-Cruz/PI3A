import '../model/signup.dart';

abstract class ISignup {
  Future<User> signup(User user);
}
