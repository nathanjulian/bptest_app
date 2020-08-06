import 'package:bptest_app/components/review_class.dart';
import 'package:flutter/material.dart';
import 'package:bptest_app/constants.dart';

class ReviewCard extends StatelessWidget {

  final Review review;
  ReviewCard({this.review});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          color: kSecondaryColor,
          border: Border.all(color: Colors.black)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(review.name),
          Text('Rating: ${review.rating}/5'),
          Text(review.comments),
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
    );
  }
}
