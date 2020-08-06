import 'package:bptest_app/firebase/auth_functions.dart';
import 'package:flutter/material.dart';
import 'package:bptest_app/constants.dart';
import 'package:bptest_app/components/page_button.dart';

class NewReviewScreen extends StatefulWidget {
  @override
  _NewReviewScreenState createState() => _NewReviewScreenState();
}

class _NewReviewScreenState extends State<NewReviewScreen> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  String rating = '';
  int ratingInt = 0;
  String comments = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            Text('NEW REVIEW', style: kPageHeadingStyle,),
            Container(
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                  color: kSecondaryColor,
                  border: Border.all(color: Colors.black)
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      validator: (val) =>
                      int.parse(val)>5 || val.isEmpty ? 'Give a rating between 0-5' : null,
                      decoration: InputDecoration(
                        focusColor: Colors.white,
                        border: OutlineInputBorder(),
                        labelText: 'Rating (out of 5)',
                      ),
                      onChanged: (val) {
                        setState(() => rating = val);
                      },
                    ),
                    SizedBox(height: 10.0,),
                    TextFormField(
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        border: OutlineInputBorder(),
                        labelText: 'Additional comments',
                      ),
                      onChanged: (val) {
                        setState(() => comments = val);
                      },
                    ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('Upload image'),
                      IconButton(icon: Icon(Icons.add_photo_alternate), onPressed: (){}),
                    ],
                  ),
                ],
                ),
              ),
            ),
            PageButton(
              press: () {_formKey.currentState.validate();},
              text: 'SUBMIT',
            ),
          ],
        ),
      ),
    );

  }
}