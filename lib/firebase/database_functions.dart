import 'dart:io';

import 'package:bptest_app/components/users.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:bptest_app/components/review_class.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';


class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  //collection reference
  final CollectionReference reviewsCollection =
      Firestore.instance.collection('reviews');



  Future updateUserReview(
      String name, String product, String rating, String comments, int votes, String photos) async {
    return await reviewsCollection.document(uid).setData({
      'Name': name,
      'Product': product,
      'Rating': rating,
      'Comments': comments,
      'Votes' : votes,
      'Photos' : photos,
    });
  }

  Future updateReviewVotes(int votes) async {
    return await reviewsCollection.document(uid).setData({
      'Votes' : votes,
    });
  }

  // get review stream
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
          votes: doc.data['Votes'] ?? '',
        photo: doc.data['Photos'] ?? '',
      );
    }).toList();
  }

  //get user document stream
  Stream<UserData> get userData {
    return reviewsCollection.document(uid).snapshots().map(_userDataFromSnapshot);
  }

  //userdata snapshot
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
      uid: uid,
        name: snapshot.data['Name'],
        product: snapshot.data['Product'],
        rating: snapshot.data['Rating'],
        comments: snapshot.data['Comments'],
        votes: snapshot.data['Votes'],
    photos : snapshot.data['Photos'],
    );
  }




}
