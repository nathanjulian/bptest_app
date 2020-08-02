import 'package:bptest_app/firebase/auth_functions.dart';
import 'package:flutter/material.dart';
import 'package:bptest_app/components/page_button.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  String email = '';
  String username = '';
  String password = '';
  String confirmPassword = '';
  String error = '';

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

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
                validator: (val) => val.isEmpty ? 'Invalid e-mail address' : null ,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'E-mail',
                ),
                onChanged: (val) {
                  setState(() => email = val);
                },
              ),
              SizedBox(height: 20.0),
              TextFormField(
                validator: (val) => val.isEmpty ? 'Username already taken' : null ,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Username',
                ),
                onChanged: (val) {
                  setState(() => username = val);
                },
              ),
              SizedBox(height: 20.0),
              TextFormField(
                validator: (val) => val.length < 6 ? 'Password needs to have at least 6 characters' : null ,
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
                onChanged: (val) {
                  setState(() => password = val);
                },
              ),
              SizedBox(height: 20.0),
              TextFormField(
                validator: (val) => val != password ? 'Passwords do not match' : null ,
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Confirm Password',
                ),
                onChanged: (val) {
                  setState(() => confirmPassword = val);
                },
              ),
              SizedBox(height: 50.0),
              PageButton(
                text: 'CREATE ACCOUNT',
                press: () async {
                  if(_formKey.currentState.validate())  {
                    dynamic result = await _auth.registerAccount(email, password);
                    if(result == null) {
                      setState(() {
                        error = 'Please enter a valid e-mail address';
                        showDialog(
                            context: context,
                          barrierDismissible: true,
                          builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('Error'),
                                content: Text(error),
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
            ],
          ),
        ),
      ),
    );
  }
}
