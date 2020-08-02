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
  final _formKey = GlobalKey<FormState>();

  String userEmail = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 70.0, horizontal: 30.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                validator: (val) =>
                    val.isEmpty ? 'Invalid username or e-mail address' : null,
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
                validator: (val) => val.length < 6 ? 'Invalid password' : null,
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
                  if (_formKey.currentState.validate()) {
                    dynamic result = await _auth.logIn(userEmail, password);
                  if(result == null) {
                      setState(() {
                        showDialog(
                            context: context,
                          barrierDismissible: true,
                          builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('Error'),
                                content: Text('Account does not exist. Please create an account'),
                                actions: [
                                  FlatButton(
                                    child: Text('OK'),
                                    onPressed: () {Navigator.of(context).pop();},
                                  )
                                ],
                              );
                          }
                        );
                      });
                    }
                  }
                },
              ),
              SizedBox(height: 20.0),
              PageButton(
                  press: () {
                    Navigator.pushNamed(context, 'Sign Up');
                  },
                  text: 'SIGN UP'),
              SizedBox(
                height: 100.0,
              ),
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
