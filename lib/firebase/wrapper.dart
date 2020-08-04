import 'package:flutter/material.dart';
import 'package:bptest_app/screens/login_screen.dart';
import 'package:bptest_app/screens/products_screen.dart';
import 'package:bptest_app/components/users.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);


    return user != null ? ProductsScreen() : LoginScreen();
  }
}
