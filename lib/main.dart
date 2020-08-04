import 'package:bptest_app/firebase/auth_functions.dart';
import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/signup_screen.dart';
import 'screens/adminLogin_screen.dart';
import 'screens/products_screen.dart';
import 'screens/product_screen.dart';
import 'screens/review_screen.dart';
import 'screens/newReview_screen.dart';
import 'screens/chat_screen.dart';
import 'firebase/wrapper.dart';
import 'package:provider/provider.dart';
import 'components/users.dart';
import 'constants.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().userLoginStatus,
      child: MaterialApp(
        home: Wrapper(),
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
      ),
    );
  }
}
