import 'package:bptest_app/components/users.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  //create instance object to use FirebaseAuth methods


  //create user obj based on user id
  User _userFromFirebaseUser(FirebaseUser user) {
    return user !=null ? User(userID: user.uid) : null;
  }

  //user auth change stream
  Stream<User> get userLoginStatus {
    return _auth.onAuthStateChanged.map( _userFromFirebaseUser);
  }

  Future logIn() async {
    try{
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    }catch(e) {
      print(e.toString());
      return null;
    }
  }
}