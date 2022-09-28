import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AttractionRemoteDataSource {
  Stream<QuerySnapshot<Map<String, dynamic>>> getAttractionStream() {
    try {
      final userId = FirebaseAuth.instance.currentUser?.uid;
      if (userId == null) {
        throw Exception('User is not logged in');
      }
      final stream = FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .collection('attraction')
          .snapshots();
      return stream;
    } catch (error) {
      throw Exception(error.toString());
    }
  }

  Future<void> addAttraction({required String title}) async {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId == null) {
      throw Exception('User is not logged in');
    }
    await FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('attraction')
        .add(
      {
        'title': title,
      },
    );
  }

  Future<void> removeAttraction({required String id}) {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId == null) {
      throw Exception('User is not logged in');
    }
    return FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('attraction')
        .doc(id)
        .delete();
  }
}
