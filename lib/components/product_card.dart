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
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(image), fit: BoxFit.cover),
              ),
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