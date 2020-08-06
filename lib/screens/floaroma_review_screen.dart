import 'package:bptest_app/components/review_class.dart';
import 'package:bptest_app/firebase/auth_functions.dart';
import 'package:flutter/material.dart';
import 'package:bptest_app/constants.dart';
import 'package:bptest_app/components/page_button.dart';
import 'package:bptest_app/firebase/database_functions.dart';
import 'package:provider/provider.dart';
import 'package:bptest_app/components/review_list.dart';

class FloaromaReviewScreen extends StatefulWidget {
  @override
  _FloaromaReviewScreenState createState() => _FloaromaReviewScreenState();
}

class _FloaromaReviewScreenState extends State<FloaromaReviewScreen> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Review>>.value(
      value: DatabaseService().reviews,
      child: Scaffold(
        drawer: Drawer(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ListTile(
                title: Text('PRODUCTS'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, 'Products');
                },
              ),
              ListTile(
                title: Text('CHAT'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, 'Chat');
                },
              ),
              ListTile(
                title: Text('LOG OUT'),
                onTap: () async {
                  await _auth.logOut();
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
        appBar: AppBar(
          title: Text('Butterflies & Petals'),
          backgroundColor: kSecondaryColor,
        ),
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0),
          child: Column(
            children: [
              Text(
                'REVIEWS',
                style: kPageHeadingStyle,
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  PageButton(
                      press: () {
                        Navigator.pushNamed(context, 'New Review');
                      },
                      text: 'ADD REVIEW'),
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
              ReviewList(),
            ],
          ),
        ),
      ),
    );
  }
}
