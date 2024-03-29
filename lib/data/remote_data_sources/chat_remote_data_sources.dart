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
          .orderBy('timestamp')
          .snapshots();
      return stream;
    } catch (error) {
      throw Exception(error.toString());
    }
  }

  Future<void> sendMessage({
    required String text,
    required String email,
  }) async {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId == null) {
      throw Exception('User is not logged in');
    }
    await FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('messages')
        .add({
      'text': text,
      'sender': email,
      'timestamp': FieldValue.serverTimestamp(),
    });
  }
}
