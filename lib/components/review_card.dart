import 'package:bptest_app/components/review_class.dart';
import 'package:bptest_app/firebaseStuff//database_functions.dart';
import 'package:flutter/material.dart';
import 'package:bptest_app/constants.dart';

class ReviewCard extends StatefulWidget {

  final Review review;
  ReviewCard({this.review});

  @override
  _ReviewCardState createState() => _ReviewCardState();
}

class _ReviewCardState extends State<ReviewCard> {

  DatabaseService _databaseService = DatabaseService();

  Color upColor = Colors.black;
  Color downColor = Colors.black;
  int votes = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          color: kSecondaryColor, border: Border.all(color: Colors.black)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.review.name),
          Text('Rating: ${widget.review.rating}/5'),
          Text(widget.review.comments),
          Container(
              height: 40, width: 40, child: Image.network(widget.review.photo)),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                  icon: Icon(
                    Icons.thumb_up,
                    color: upColor,
                  ),
                  onPressed: () {
                    setState(() {
                      if (upColor == Colors.black &&
                          downColor == Colors.black) {
                        upColor = Colors.green;
                        widget.review.votes++;
                      } else if (downColor != Colors.black) {
                        upColor = Colors.green;
                        downColor = Colors.black;
                        widget.review.votes = widget.review.votes + 2;
                      } else {
                        upColor = Colors.black;
                        widget.review.votes--;
                      }
                      votes = widget.review.votes;
                      _databaseService.updateReviewVotes(votes);
                    });
                  }),
              Text(widget.review.votes.toString()),
              IconButton(
                  icon: Icon(
                    Icons.thumb_down,
                    color: downColor,
                  ),
                  onPressed: () {
                    setState(() {
                      if (downColor == Colors.black &&
                          upColor == Colors.black) {
                        downColor = Colors.red;
                        widget.review.votes--;
                      } else if (upColor != Colors.black) {
                        upColor = Colors.black;
                        downColor = Colors.red;
                        widget.review.votes = widget.review.votes - 2;
                      } else {
                        downColor = Colors.black;
                        widget.review.votes++;
                      }
                    });
                    votes = widget.review.votes;
                    print(votes);
                  }),
            ],
          )
        ],
      ),
    );
  }
}
