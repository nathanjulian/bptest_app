import 'package:bptest_app/components/review_class.dart';
import 'package:bptest_app/firebase/database_functions.dart';
import 'package:flutter/material.dart';
import 'package:bptest_app/constants.dart';

class ReviewCard extends StatefulWidget {

  final Review review;
  ReviewCard({this.review});

  @override
  _ReviewCardState createState() => _ReviewCardState();
}

class _ReviewCardState extends State<ReviewCard> {

  final DatabaseService _databaseService = DatabaseService();

  Color upColor = Colors.black;
  Color downColor = Colors.black;

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
          Text(widget.review.name),
          Text('Rating: ${widget.review.rating}/5'),
          Text(widget.review.comments),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(icon: Icon(Icons.thumb_up, color: upColor,), onPressed: (){
                setState(() {
                  if (upColor == Colors.black && downColor == Colors.black) {
                    upColor = Colors.green;
                    widget.review.votes ++;
                  }
                  else if(downColor != Colors.black) {
                    upColor = Colors.green;
                    downColor = Colors.black;
                    widget.review.votes ++;
                  }
                  else{
                    upColor = Colors.black;
                    widget.review.votes --;
                  }
                });
              }),
              Text(widget.review.votes.toString()),
              IconButton(icon: Icon(Icons.thumb_down, color: downColor,), onPressed: (){
                setState(() {
                  if (downColor == Colors.black && upColor == Colors.black) {
                    downColor = Colors.red;
                    widget.review.votes --;
                  }
                  else if(upColor != Colors.black) {
                    upColor = Colors.black;
                    downColor = Colors.red;
                    widget.review.votes --;
                  }
                  else{
                    downColor = Colors.black;
                    widget.review.votes ++;
                  }
                });
              }),
            ],
          ),
        ],
      ),
    );
  }
}
