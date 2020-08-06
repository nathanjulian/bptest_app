import 'package:bptest_app/firebase/auth_functions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:bptest_app/constants.dart';
import 'package:bptest_app/components/page_button.dart';
import 'package:bptest_app/firebase/database_functions.dart';
import 'package:provider/provider.dart';

class FloaromaReviewScreen extends StatefulWidget {
  @override
  _FloaromaReviewScreenState createState() => _FloaromaReviewScreenState();
}

class _FloaromaReviewScreenState extends State<FloaromaReviewScreen> {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return StreamProvider<QuerySnapshot>.value(
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
              Text('REVIEWS', style: kPageHeadingStyle,),
              SizedBox(height: 20.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  PageButton(press: () {Navigator.pushNamed(context, 'New Review');}, text: 'ADD REVIEW'),
                ],
              ),
              SizedBox(height: 10.0,),
              Container(
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: kSecondaryColor,
                    border: Border.all(color: Colors.black)
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('MrPeePee'),
                    Text('Rating: 5/5'),
                    Text('blah blah blah'),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(icon: Icon(Icons.thumb_up), onPressed: (){}),
                        Text('6'),
                        IconButton(icon: Icon(Icons.thumb_down), onPressed: (){}),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}