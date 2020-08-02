import 'package:bptest_app/firebase/auth_functions.dart';
import 'package:flutter/material.dart';
import 'package:bptest_app/components/page_button.dart';

class AdminLogin extends StatefulWidget {
  @override
  _AdminLoginState createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {
  final AuthService _auth = AuthService();

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
                  labelText: 'Username',
                ),
              ),
              SizedBox(height: 20.0),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
              SizedBox(height: 50.0),
              PageButton(
                text: 'LOG IN',
                press: () async {
                  dynamic result = await _auth.logIn();
                  result == null
                      ? print('login error')
                      : print('logged in, ' + result.toString());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
