import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ItemsRemoteDataSource {
  Stream<QuerySnapshot<Map<String, dynamic>>> getItemsStream() {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId == null) {
      throw Exception('User is not logged in');
    }
    try {
      final stream = FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .collection('items')
          .snapshots();
      return stream;
    } catch (error) {
      throw Exception(error.toString());
    }
  }

  Future<void> removeItems({required String id}) {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId == null) {
      throw Exception('User is not logged in');
    }
    return FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('items')
        .doc(id)
        .delete();
  }

  Future<void> updateItems({
    required String id,
    required String city,
    required String adress,
    required DateTime date,
    required String time,
  }) async {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId == null) {
      throw Exception('User is not logged in');
    }
    try {
      final update = await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .collection('items')
          .doc(id)
          .update({
        'city': city,
        'adress': adress,
        'date': date,
        'time': time,
      });
      return update;
    } catch (error) {
      throw Exception(error.toString());
    }
  }

  Future<void> addDateItems({
    required String city,
    required String adress,
    required DateTime date,
    required String time,
  }) {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId == null) {
      throw Exception('User is not logged in');
    }
    return FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('items')
        .add(
      {
        'city': city,
        'adress': adress,
        'date': date,
        'time': time,
      },
    );
  }
}
