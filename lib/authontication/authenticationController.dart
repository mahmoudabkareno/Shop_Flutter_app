import 'package:shop/authontication/athenticatable.dart';
import 'package:shop/user/user.dart';

class FireBaseAuthenticationController implements Authenticatable{
  @override
  Future<bool> logIn(String email, String password) {
    // TODO: implement logIn
    throw UnimplementedError();
  }

  @override
  Future<User> register(String email, String password) {
    // TODO: implement register
    throw UnimplementedError();
  }

  @override
  Future<bool> resetPassword(String email) {
    // TODO: implement resetPassword
    throw UnimplementedError();
  }

  @override
  Future<User> updateUser(User user) {
    // TODO: implement updateUser
    throw UnimplementedError();
  }

}