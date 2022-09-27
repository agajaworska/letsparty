import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:letsparty/domain/models/theme_model.dart';

class RemoteDataSource {
  Stream<QuerySnapshot<Map<String, dynamic>>> getItemsStream() {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId == null) {
      throw Exception('User is not logged in');
    }
    try {
      final stream = FirebaseFirestore.instance
          .collection('app')
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
        .collection('app')
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
          .collection('app')
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
        .collection('app')
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

  Stream<QuerySnapshot<Map<String, dynamic>>> getMenuStream() {
    try {
      final userId = FirebaseAuth.instance.currentUser?.uid;
      if (userId == null) {
        throw Exception('User is not logged in');
      }
      final stream = FirebaseFirestore.instance
          .collection('app')
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
        .collection('app')
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
        .collection('app')
        .doc(userId)
        .collection('menu')
        .doc(id)
        .delete();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getThemeStream() {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId == null) {
      throw Exception('User is not logged in');
    }
    try {
      final stream = FirebaseFirestore.instance
          .collection('app')
          .doc(userId)
          .collection('themePhotos')
          .snapshots();
      return stream;
    } catch (error) {
      throw Exception(error.toString());
    }
  }

  Future<void> addThemePhoto({
    required String imageUrl,
  }) async {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId == null) {
      throw Exception('User is not logged in');
    }
    await FirebaseFirestore.instance
        .collection('app')
        .doc(userId)
        .collection('themePhotos')
        .add(
      {
        'image_url': imageUrl,
      },
    );
  }

  Future<ThemeModel> getPhoto(
      {required String id, required String imageUrl}) async {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId == null) {
      throw Exception('User is not logged in');
    }
    await FirebaseFirestore.instance
        .collection('app')
        .doc(userId)
        .collection('themePhotos')
        .doc(id)
        .get();
    return ThemeModel(
      id: id,
      imageUrl: imageUrl,
    );
  }

  Future<void> removeThemePhoto({required String id}) {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId == null) {
      throw Exception('User is not logged in');
    }
    return FirebaseFirestore.instance
        .collection('app')
        .doc(userId)
        .collection('themePhotos')
        .doc(id)
        .delete();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getUserStream() {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId == null) {
      throw Exception('User is not logged in');
    }
    try {
      final stream = FirebaseFirestore.instance
          .collection('app')
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
        .collection('app')
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
        .collection('app')
        .doc(userId)
        .collection('user')
        .doc(id)
        .delete();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getBudgetStream() {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId == null) {
      throw Exception('User is not logged in');
    }
    try {
      final stream = FirebaseFirestore.instance
          .collection('app')
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
        .collection('app')
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
          .collection('app')
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
        .collection('app')
        .doc(userId)
        .collection('finance')
        .doc(id)
        .delete();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getAddSpendingsStream() {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId == null) {
      throw Exception('User is not logged in');
    }
    try {
      final stream = FirebaseFirestore.instance
          .collection('app')
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
        .collection('app')
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
        .collection('app')
        .doc(userId)
        .collection('spendings')
        .doc(id)
        .delete();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getAttractionStream() {
    try {
      final userId = FirebaseAuth.instance.currentUser?.uid;
      if (userId == null) {
        throw Exception('User is not logged in');
      }
      final stream = FirebaseFirestore.instance
          .collection('app')
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
        .collection('app')
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
        .collection('app')
        .doc(userId)
        .collection('attraction')
        .doc(id)
        .delete();
  }
}
