import 'package:bptest_app/components/users.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {

  //create instance object
  final FirebaseAuth _auth = FirebaseAuth.instance;


  //create user obj
  User _userFromFirebaseUser(FirebaseUser user) {
    return user !=null ? User(userID: user.uid) : null;
  }

  //user auth change stream
  Stream<User> get userLoginStatus {
    return _auth.onAuthStateChanged.map( _userFromFirebaseUser);
  }

  //function to log in with username
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

 //log out function
  Future logOut() async {
    try{
      return await _auth.signOut();
    } catch(e) {
      print(e.toString());
      return null;
    }
  }

  //register account
  Future registerAccount(String email, String password) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch(e) {
      print(e.toString());
      return null;
    }
  }
}