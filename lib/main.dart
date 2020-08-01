import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/signup_screen.dart';
import 'screens/adminLogin_screen.dart';
import 'screens/products_screen.dart';
import 'screens/product_screen.dart';
import 'screens/review_screen.dart';
import 'screens/newReview_screen.dart';
import 'screens/chat_screen.dart';
import 'constants.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginScreen(),
      theme: ThemeData(
          primaryColor: kTertiaryColor,
          accentColor: kSecondaryColor,
          scaffoldBackgroundColor: kPrimaryColor
      ),
      routes: {
        'Login' : (context) => LoginScreen(),
        'Sign Up' : (context) => SignUpScreen(),
        'Admin Login' : (context) => AdminLogin(),
        'Products' : (context) => ProductsScreen(),
        'Product' : (context) => ProductScreen(),
        'Reviews' : (context) => ReviewScreen(),
        'New Review' : (context) => NewReviewScreen(),
        'Chat' : (context) => ChatScreen(),
      },
    );
  }
}
