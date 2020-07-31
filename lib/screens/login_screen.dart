import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bptest_app/components/page_button.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 70.0, horizontal: 30.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Username',
              ),
            ),
            SizedBox(height: 20.0),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
              ),
            ),
            SizedBox(height: 50.0),
            PageButton(
              text: 'LOG IN',
              press: () {
                Navigator.pushNamed(context, 'Products');
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
    );
  }
}
