import 'package:flutter/material.dart';
import 'package:bptest_app/constants.dart';

class PageButton extends StatelessWidget {

  final Function press;
  final String text;

  PageButton({@required this.press, @required this.text});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: press,
      padding: EdgeInsets.all(10.0),
      color: kSecondaryColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0),),
      child: Text(text,
        style:kPageButtonTextStyle,),
    );
  }
}