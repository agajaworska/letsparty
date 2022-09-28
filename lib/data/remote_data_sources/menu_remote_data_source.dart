import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MenuRemoteDataSource {
  Stream<QuerySnapshot<Map<String, dynamic>>> getMenuStream() {
    try {
      final userId = FirebaseAuth.instance.currentUser?.uid;
      if (userId == null) {
        throw Exception('User is not logged in');
      }
      final stream = FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .collection('menu')
          .snapshots();
      return stream;
    } catch (error) {
      throw Exception(error.toString());
    }
  }

  Future<void> addMenuDocuments({
    required String title,
  }) async {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId == null) {
      throw Exception('User is not logged in');
    }
    await FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('menu')
        .add(
      {
        'title': title,
      },
    );
  }

  Future<void> removeMenu({required String id}) {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId == null) {
      throw Exception('User is not logged in');
    }
    return FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('menu')
        .doc(id)
        .delete();
  }
}
