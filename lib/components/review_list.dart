import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

class ReviewList extends StatefulWidget {
  @override
  _ReviewListState createState() => _ReviewListState();
}

class _ReviewListState extends State<ReviewList> {
  @override
  Widget build(BuildContext context) {

    final reviews = Provider.of<QuerySnapshot>(context);
    //print(reviews.documents);

    for(var doc in reviews.documents){
      print(doc.data);
    }

    return Container();
  }
}
