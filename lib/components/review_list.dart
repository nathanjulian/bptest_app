import 'package:bptest_app/components/review_card.dart';
import 'package:bptest_app/components/review_class.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class ReviewList extends StatefulWidget {
  @override
  _ReviewListState createState() => _ReviewListState();
}

class _ReviewListState extends State<ReviewList> {

  @override
  Widget build(BuildContext context) {

    final reviews = Provider.of<List<Review>>(context);

    return ListView.builder(
      shrinkWrap: true,
      itemCount: reviews.length,
      itemBuilder: (context, index) {
        return ReviewCard(review: reviews[index],);
      },
    );
  }
}
