import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bptest_app/constants.dart';
import 'package:bptest_app/components/product_card.dart';


class ProductsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {}),
        title: Text('Butterflies & Petals'),
        backgroundColor: kSecondaryColor,
      ),
      body: Center(
        child: Container(
            margin: EdgeInsets.symmetric(vertical: 70.0, horizontal: 30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ProductCard(
                    press: () {
                      Navigator.pushNamed(context, 'Product');
                    },
                    productName: 'Floaroma',
                    image: 'assets/images/bouquet.jpg',
                    price: 69.69),
                ProductCard(
                    press: () {
                      Navigator.pushNamed(context, 'Product');
                    },
                    productName: 'Eterna',
                    image: 'assets/images/bouquet.jpg',
                    price: 69.69),
              ],
            ),
        ),
      ),
    );
  }
}
