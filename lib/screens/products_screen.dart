import 'package:flutter/material.dart';
import 'package:bptest_app/constants.dart';

class ProductsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.menu), onPressed: () {}),
        title: Text('Butterflies & Petals'),
        backgroundColor: kSecondaryColor,
      ),
    );
  }
}
