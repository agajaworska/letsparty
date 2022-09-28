import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserRemoteDataSource {
  Stream<QuerySnapshot<Map<String, dynamic>>> getUserStream() {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId == null) {
      throw Exception('User is not logged in');
    }
    try {
      final stream = FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .collection('user')
          .snapshots();
      return stream;
    } catch (error) {
      throw Exception(error.toString());
    }
  }

  Future<void> addUserItems({
    required String name,
    required String photo,
  }) async {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId == null) {
      throw Exception('User is not logged in');
    }
    await FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('user')
        .add(
      {
        'name': name,
        'photo': photo,
      },
    );
  }

  Future<void> removeUserItems({required String id}) {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId == null) {
      throw Exception('User is not logged in');
    }
    return FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('user')
        .doc(id)
        .delete();
  }
}
