import 'package:bptest_app/components/users.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:bptest_app/components/custom_web_view.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {

  //create firebaseauth instance object
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //create google log in instance object
  final GoogleSignIn googleSignIn = GoogleSignIn();


  //create user obj
  User _userFromFirebaseUser(FirebaseUser user) {
    return user !=null ? User(userID: user.uid, email: user.email) : null;
  }


  //user auth change stream
  Stream<User> get userLoginStatus {
    return _auth.onAuthStateChanged.map( _userFromFirebaseUser);
  }

  //function to log in anon
  Future logInAnon() async {
    try{
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    }catch(e) {
      print(e.toString());
      return null;
    }
  }

  //log in with email
  Future logIn(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch(e) {
      print(e.toString());
      return e.toString();
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

  String clientID = "3164319606969751";
  String redirectURL =
      "https://www.facebook.com/connect/login_success.html";

  //facebook login
  loginWithFacebook(BuildContext context) async{
    String result = await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => CustomWebView(
            selectedUrl:
            'https://www.facebook.com/dialog/oauth?client_id=$clientID&redirect_uri=$redirectURL&response_type=token&scope=email,public_profile,',
          ),
          maintainState: true));

        if (result != null) {
      try {
        final facebookAuthCred =
        FacebookAuthProvider.getCredential(accessToken: result);
        final user =
        await _auth.signInWithCredential(facebookAuthCred);
      } catch (e) {}
    }
  }

  //google login
  googleLogIn() async {
    final GoogleSignInAccount googleUser = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);
    final FirebaseUser user = (await _auth.signInWithCredential(credential)).user;


  }


}