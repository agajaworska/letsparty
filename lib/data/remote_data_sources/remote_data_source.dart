import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:letsparty/domain/models/theme_model.dart';

class RemoteDataSource {
  Stream<QuerySnapshot<Map<String, dynamic>>> getItemsStream() {
    try {
      final stream = FirebaseFirestore.instance.collection('items').snapshots();
      return stream;
    } catch (error) {
      throw Exception(error.toString());
    }
  }

  Future<void> removeItems({required String id}) {
    return FirebaseFirestore.instance.collection('items').doc(id).delete();
  }

  Future<void> updateItems({
    required String id,
    required String city,
    required String adress,
    required DateTime date,
    required String time,
  }) async {
    try {
      final update =
          await FirebaseFirestore.instance.collection('items').doc(id).update({
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
    return FirebaseFirestore.instance.collection('items').add(
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
      final stream = FirebaseFirestore.instance.collection('menu').snapshots();
      return stream;
    } catch (error) {
      throw Exception(error.toString());
    }
  }

  Future<void> addMenuDocuments({
    required String title,
  }) async {
    await FirebaseFirestore.instance.collection('menu').add(
      {
        'title': title,
      },
    );
  }

  Future<void> removeMenu({required String id}) {
    return FirebaseFirestore.instance.collection('menu').doc(id).delete();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getThemeStream() {
    try {
      final stream =
          FirebaseFirestore.instance.collection('themePhotos').snapshots();
      return stream;
    } catch (error) {
      throw Exception(error.toString());
    }
  }

  Future<void> addThemePhoto({
    required String imageUrl,
  }) async {
    await FirebaseFirestore.instance.collection('themePhotos').add(
      {
        'image_url': imageUrl,
      },
    );
  }

  Future<ThemeModel> getPhoto(
      {required String id, required String imageUrl}) async {
    await FirebaseFirestore.instance.collection('themePhotos').doc(id).get();
    return ThemeModel(
      id: id,
      imageUrl: imageUrl,
    );
  }

  Future<void> removeThemePhoto({required String id}) {
    return FirebaseFirestore.instance
        .collection('themePhotos')
        .doc(id)
        .delete();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getUserStream() {
    try {
      final stream = FirebaseFirestore.instance.collection('user').snapshots();
      return stream;
    } catch (error) {
      throw Exception(error.toString());
    }
  }

  Future<void> addUserItems({
    required String name,
    required String photo,
  }) async {
    await FirebaseFirestore.instance.collection('user').add(
      {
        'name': name,
        'photo': photo,
      },
    );
  }

  Future<void> removeUserItems({required String id}) {
    return FirebaseFirestore.instance.collection('user').doc(id).delete();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getBudgetStream() {
    try {
      final stream =
          FirebaseFirestore.instance.collection('finance').snapshots();
      return stream;
    } catch (error) {
      throw Exception(error.toString());
    }
  }

  Future<void> addBudgetDocuments({
    required String data,
  }) async {
    await FirebaseFirestore.instance.collection('finance').add(
      {
        'data': data,
      },
    );
  }

  Future<void> updateBudgetDocuments({
    required String id,
    required String data,
  }) async {
    try {
      final update = await FirebaseFirestore.instance
          .collection('finance')
          .doc(id)
          .update({'data': data});
      return update;
    } catch (error) {
      throw Exception(error.toString());
    }
  }

  Future<void> removeBudgetDocuments({required String id}) {
    return FirebaseFirestore.instance.collection('finance').doc(id).delete();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getAddSpendingsStream() {
    try {
      final stream =
          FirebaseFirestore.instance.collection('spendings').snapshots();
      return stream;
    } catch (error) {
      throw Exception(error.toString());
    }
  }

  Future<void> addSpendings({
    required String name,
    required String price,
  }) async {
    await FirebaseFirestore.instance.collection('spendings').add(
      {
        'name': name,
        'outgoing': price,
      },
    );
  }

  Future<void> removeSpendings({required String id}) {
    return FirebaseFirestore.instance.collection('spendings').doc(id).delete();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getAttractionStream() {
    try {
      final stream =
          FirebaseFirestore.instance.collection('attraction').snapshots();
      return stream;
    } catch (error) {
      throw Exception(error.toString());
    }
  }

  Future<void> addAttraction({required String title}) async {
    await FirebaseFirestore.instance.collection('attraction').add(
      {
        'title': title,
      },
    );
  }

  Future<void> removeAttraction({required String id}) {
    return FirebaseFirestore.instance.collection('attraction').doc(id).delete();
  }
}
