import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SpendingsRemoteDataSource {
  Stream<QuerySnapshot<Map<String, dynamic>>> getAddSpendingsStream() {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId == null) {
      throw Exception('User is not logged in');
    }
    try {
      final stream = FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .collection('spendings')
          .snapshots();
      return stream;
    } catch (error) {
      throw Exception(error.toString());
    }
  }

  Future<void> addSpendings({
    required String name,
    required String price,
  }) async {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId == null) {
      throw Exception('User is not logged in');
    }
    await FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('spendings')
        .add(
      {
        'name': name,
        'outgoing': price,
      },
    );
  }

  Future<void> removeSpendings({required String id}) {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId == null) {
      throw Exception('User is not logged in');
    }
    return FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('spendings')
        .doc(id)
        .delete();
  }
}
