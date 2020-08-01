import 'package:flutter/material.dart';
import 'package:bptest_app/constants.dart';
import 'package:bptest_app/components/page_button.dart';

class NewReviewScreen extends StatefulWidget {
  @override
  _NewReviewScreenState createState() => _NewReviewScreenState();
}

class _NewReviewScreenState extends State<NewReviewScreen> {
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
            )
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
                  Text('Floaroma'),
                  Text('Rating: 5/5'),
                  Text('blah blah blah'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(icon: Icon(Icons.add_photo_alternate), onPressed: (){}),
                    ],
                  ),
                ],
              ),
            ),
            PageButton(
              press: () {},
              text: 'SUBMIT',
            ),
          ],
        ),
      ),
    );

  }
}