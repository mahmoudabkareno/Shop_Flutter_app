import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';


class FireBaseAuth{

  FirebaseAuth _fireBaseAuth = FirebaseAuth.instance;

  Future<User> registeration(String e , String pass) async{
    UserCredential userCredential = await _fireBaseAuth.createUserWithEmailAndPassword(
        email: e,
        password: pass);
    return userCredential.user;
  }

  Future<User> getCurrentUser() async {
    User user = await _fireBaseAuth.currentUser;
    print(user);
    return user;
  }

  signIn(String e , String pass) async{

    var user = await _fireBaseAuth.signInWithEmailAndPassword(
        email: e,
        password: pass);
    return user;
  }

  signOut() async{
    await _fireBaseAuth.signOut();
  }

}