import 'package:bptest_app/firebase/auth_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bptest_app/components/page_button.dart';


class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final AuthService _auth = AuthService();

  String userEmail = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 70.0, horizontal: 30.0),
        child: Form(
          child: ListView(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Username or E-mail',
                ),
                onChanged: (val) {
                  setState(() => userEmail = val);
                },
              ),
              SizedBox(height: 20.0),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
                onChanged: (val) {
                  setState(() => password = val);
                },
              ),
              SizedBox(height: 50.0),
              PageButton(
                text: 'LOG IN',
                press: () async {
                  print(userEmail);
                  print(password);
//                  dynamic result = await _auth.logIn();
//                  result == null ? print('login error') : print('logged in, ' + result.toString());
                },
              ),
              SizedBox(height: 20.0),
              PageButton(
                  press: () {
                    Navigator.pushNamed(context, 'Sign Up');
                  },
                  text: 'SIGN UP'),
              SizedBox(height: 100.0,),
              PageButton(
                  press: () {
                    Navigator.pushNamed(context, 'Admin Login');
                  },
                  text: 'ADMIN LOGIN'),
            ],
          ),
        ),
      ),
    );
  }
}
