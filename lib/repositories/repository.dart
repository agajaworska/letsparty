import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:letsparty/models/item_model.dart';

class Repository {
  Stream<List<ItemModel>> getItemsStream() {
    return FirebaseFirestore.instance.collection('items').snapshots().map(
      (querySnapshot) {
        return querySnapshot.docs.map(
          (doc) {
            return ItemModel(
              id: doc.id,
              adress: doc['adress'],
              date: (doc['date'] as Timestamp).toDate(),
              time: (doc['time']),
            );
          },
        ).toList();
      },
    );
  }

  Future<void> removeItems({required String id}) {
    return FirebaseFirestore.instance.collection('items').doc(id).delete();
  }

  Future<void> updateItems({
    required String id,
    required String adress,
    required DateTime date,
    required String time,
  }) async {
    await FirebaseFirestore.instance.collection('items').doc(id).update({
      'adress': adress,
      'date': date,
      'time': time,
    });
  }
}
