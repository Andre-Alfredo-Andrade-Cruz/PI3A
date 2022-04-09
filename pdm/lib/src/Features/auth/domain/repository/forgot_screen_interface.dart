import '../model/forgot.dart';

abstract class IForgot {
  Future<User> forgot(User user);
}
