import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bptest_app/constants.dart';

class ProductCard extends StatelessWidget {
  final Function press;
  final String productName;
  final String image;
  final double price;

  ProductCard(
      {@required this.press,
        @required this.productName,
        @required this.image,
        @required this.price});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      padding: EdgeInsets.all(10),
      color: kTertiaryColor,
      onPressed: press,
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.all(30),
              child: Image.network('https://firebasestorage.googleapis.com/v0/b/bp-test-30275.appspot.com/o/download.jpg?alt=media&token=26d6cbc2-e89c-4e53-bbdf-4070bcb90239'),
            ),
            Text(productName, style: kCollectionCardTextStyle),
            Text('\$' + price.toStringAsFixed(2),
                style: kCollectionCardTextStyle)
          ],
        ),
      ),
    );
  }
}