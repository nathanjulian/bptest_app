import 'package:flutter/material.dart';
import 'package:bptest_app/constants.dart';

class QuantityButton extends StatelessWidget {

  final IconData icon;
  final Function press;

  QuantityButton({@required this.press, @required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: kSecondaryColor,
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: IconButton(
          icon: Icon(icon), onPressed: press,
        )
    );
  }
}