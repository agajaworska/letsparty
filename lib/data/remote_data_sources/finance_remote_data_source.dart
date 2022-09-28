import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FinanceRemoteDataSource {
  Stream<QuerySnapshot<Map<String, dynamic>>> getBudgetStream() {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId == null) {
      throw Exception('User is not logged in');
    }
    try {
      final stream = FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .collection('finance')
          .snapshots();
      return stream;
    } catch (error) {
      throw Exception(error.toString());
    }
  }

  Future<void> addBudgetDocuments({
    required String data,
  }) async {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId == null) {
      throw Exception('User is not logged in');
    }
    await FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('finance')
        .add(
      {
        'data': data,
      },
    );
  }

  Future<void> updateBudgetDocuments({
    required String id,
    required String data,
  }) async {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId == null) {
      throw Exception('User is not logged in');
    }
    try {
      final update = await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .collection('finance')
          .doc(id)
          .update({'data': data});
      return update;
    } catch (error) {
      throw Exception(error.toString());
    }
  }

  Future<void> removeBudgetDocuments({required String id}) {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId == null) {
      throw Exception('User is not logged in');
    }
    return FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('finance')
        .doc(id)
        .delete();
  }
}
