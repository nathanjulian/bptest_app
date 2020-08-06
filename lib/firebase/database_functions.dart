import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:bptest_app/components/review_class.dart';
import 'package:flutter/cupertino.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  //collection reference
  final CollectionReference reviewsCollection =
      Firestore.instance.collection('reviews');

  Future updateUserReview(
      String name, String product, String rating, String comments, int votes) async {
    return await reviewsCollection.document(uid).setData({
      'Name': name,
      'Product': product,
      'Rating': rating,
      'Comments': comments,
      'Votes' : votes,
    });
  }

  // get stream
  Stream<List<Review>> get reviews {
    return reviewsCollection.snapshots().map(_reviewListFromSnapshot);
  }

  //review list from snapshot
  List<Review> _reviewListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Review(
          name: doc.data['Name'] ?? '',
          product: doc.data['Product'] ?? '',
          rating: doc.data['Rating'] ?? '',
          comments: doc.data['Comments'] ?? '',
          votes: doc.data['Votes'] ?? ',');
    }).toList();
  }
}
