import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/signup_screen.dart';
import 'screens/adminLogin_screen.dart';
import 'screens/products_screen.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginScreen(),
      routes: {
        'Login' : (context) => LoginScreen(),
        'Sign Up' : (context) => SignUpScreen(),
        'Admin Login' : (context) => AdminLogin(),
        'Products' : (context) => ProductsScreen(),
      },
    );
  }
}
