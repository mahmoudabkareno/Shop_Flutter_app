import 'package:shop/user/user.dart';

class Authenticatable{
  Future<User> register(String email, String password){}

  Future<bool> logIn(String email ,String password){}

  Future<bool> resetPassword(String email){}

  Future<User> updateUser(User user){}
}