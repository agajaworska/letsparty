import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChatRemoteDataSource {
  Stream<QuerySnapshot<Map<String, dynamic>>> getMessagesStream() {
    try {
      final userId = FirebaseAuth.instance.currentUser?.uid;
      if (userId == null) {
        throw Exception('User is not logged in');
      }
      final stream = FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .collection('messages')
          .snapshots();
      return stream;
    } catch (error) {
      throw Exception(error.toString());
    }
  }
}
