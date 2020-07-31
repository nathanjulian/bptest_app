import 'package:bptest_app/components/quantity_buttons.dart';
import 'package:flutter/material.dart';
import 'package:bptest_app/constants.dart';
import 'package:bptest_app/components/page_button.dart';

class ProductScreen extends StatefulWidget {
  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {

  int count = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {}),
        title: Text('Butterflies & Petals'),
        backgroundColor: kSecondaryColor,
      ),
      body: Center(
        child: Column(
          children: [
            Image.asset('assets/images/bouquet.jpg'),
            Text('FlOAROMA'),
            Text('\$ 69.69'),
            Text('This is a flower bouquet lololol'),
            Row(
              children: [
                Text(
                  'Quantity',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(width: 10.0),
                QuantityButton(
                  press: () {
                    setState(() {
                      count++;
                      print(count);
                    });
                  },
                  icon: Icons.add,
                ),
                SizedBox(width: 10.0),
                Center(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      count.toString(),
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ),
                ),
                SizedBox(width: 10.0),
                QuantityButton(
                  press: () {
                    setState(() {
                      if (count > 1) {
                        count--;
                        print(count);
                      }
                    });
                  },
                  icon: Icons.remove,
                ),
              ],
            ),
            PageButton(
              press: () {},
              text: 'ADD TO CART',
            ),
            PageButton(
              press: () {
                Navigator.pushNamed(context, 'Reviews');
              },
              text: 'REVIEWS',
            ),
          ],
        ),
      ),
    );
  }
}