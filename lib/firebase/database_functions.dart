import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:bptest_app/components/review_class.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  //collection reference
  final CollectionReference reviewsCollection =
      Firestore.instance.collection('reviews');

  Future updateUserReview(
      String name, String product, String rating, String comments) async {
    return await reviewsCollection.document(uid).setData({
      'name': name,
      'product': product,
      'rating': rating,
      'comments': comments,
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
          name: doc.data['name'] ?? '',
          product: doc.data['product'] ?? '',
          rating: doc.data['rating'] ?? '',
          comments: doc.data['comments'] ?? '');
    }).toList();
  }
}
