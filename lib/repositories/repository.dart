import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:letsparty/models/addSpendings_model.dart';
import 'package:letsparty/models/attraction_model.dart';
import 'package:letsparty/models/budget_model.dart';
import 'package:letsparty/models/date_model.dart';
import 'package:letsparty/models/menu_model.dart';
import 'package:letsparty/models/theme_model.dart';
import 'package:letsparty/models/user_model.dart';

class Repository {
  Stream<List<DateModel>> getItemsStream() {
    return FirebaseFirestore.instance.collection('items').snapshots().map(
      (querySnapshot) {
        return querySnapshot.docs.map(
          (doc) {
            return DateModel(
              id: doc.id,
              city: doc['city'],
              adress: doc['adress'],
              date: (doc['date'] as Timestamp).toDate(),
              time: doc['time'],
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
    required String city,
    required String adress,
    required DateTime date,
    required String time,
  }) async {
    await FirebaseFirestore.instance.collection('items').doc(id).update({
      'city': city,
      'adress': adress,
      'date': date,
      'time': time,
    });
  }

  Future<void> addDateItems(
      {required String city,
      required String adress,
      required DateTime date,
      required String time}) {
    return FirebaseFirestore.instance.collection('items').add(
      {
        'city': city,
        'adress': adress,
        'date': date,
        'time': time,
      },
    );
  }

  Stream<List<MenuModel>> getMenuStream() {
    return FirebaseFirestore.instance.collection('menu').snapshots().map(
      (querySnapshot) {
        return querySnapshot.docs.map(
          (doc) {
            return MenuModel(
              id: doc.id,
              title: doc['title'],
            );
          },
        ).toList();
      },
    );
  }

  Future<void> removeMenu({required String id}) {
    return FirebaseFirestore.instance.collection('menu').doc(id).delete();
  }

  Future<void> addMenuDocuments({required String title}) {
    return FirebaseFirestore.instance.collection('menu').add(
      {
        'title': title,
      },
    );
  }

  Stream<List<ThemeModel>> getThemeStream() {
    return FirebaseFirestore.instance.collection('themePhotos').snapshots().map(
      (querySnapshot) {
        return querySnapshot.docs.map(
          (doc) {
            return ThemeModel(
              id: doc.id,
              imageUrl: doc['image_url'],
            );
          },
        ).toList();
      },
    );
  }

  Future<void> removeThemePhoto({required String id}) {
    return FirebaseFirestore.instance
        .collection('themePhotos')
        .doc(id)
        .delete();
  }

  Future<ThemeModel> getPhoto({required String id}) async {
    final doc = await FirebaseFirestore.instance
        .collection('themePhotos')
        .doc(id)
        .get();
    return ThemeModel(
      id: doc.id,
      imageUrl: doc['image_url'],
    );
  }

  Future<void> addThemePhoto({required String imageUrl}) {
    return FirebaseFirestore.instance.collection('themePhotos').add(
      {
        'image_url': imageUrl,
      },
    );
  }

  Stream<List<UserModel>> getUserStream() {
    return FirebaseFirestore.instance.collection('user').snapshots().map(
      (querySnapshot) {
        return querySnapshot.docs.map(
          (doc) {
            return UserModel(
              id: doc.id,
              name: doc['name'],
              photo: doc['photo'],
            );
          },
        ).toList();
      },
    );
  }

  Future<void> removeUserItems({required String id}) {
    return FirebaseFirestore.instance.collection('user').doc(id).delete();
  }

  Future<void> addUserItems({required String name, required String photo}) {
    return FirebaseFirestore.instance.collection('user').add(
      {
        'name': name,
        'photo': photo,
      },
    );
  }

  Stream<List<BudgetModel>> getBudgetStream() {
    return FirebaseFirestore.instance.collection('finance').snapshots().map(
      (querySnapshot) {
        return querySnapshot.docs.map(
          (doc) {
            return BudgetModel(
              id: doc.id,
              data: doc['data'],
            );
          },
        ).toList();
      },
    );
  }

  Future<void> removeBudgetDocuments({required String id}) {
    return FirebaseFirestore.instance.collection('finance').doc(id).delete();
  }

  Future<void> addBudgetDocuments({required String data}) {
    return FirebaseFirestore.instance.collection('finance').add(
      {
        'data': data,
      },
    );
  }

  Future<void> updateBudgetDocuments(
      {required String id, required String data}) {
    return FirebaseFirestore.instance
        .collection('finance')
        .doc(id)
        .update({data: 'data'});
  }

  Stream<List<AddSpendingsModel>> getAddSpendingsStream() {
    return FirebaseFirestore.instance.collection('spendings').snapshots().map(
      (querySnapshot) {
        return querySnapshot.docs.map(
          (doc) {
            return AddSpendingsModel(
              id: doc.id,
              name: doc['name'],
              price: doc['outgoing'],
            );
          },
        ).toList();
      },
    );
  }

  Future<void> removeSpendings({required String id}) {
    return FirebaseFirestore.instance.collection('spendings').doc(id).delete();
  }

  Future<void> addSpendings({required String name, required String price}) {
    return FirebaseFirestore.instance.collection('spendings').add(
      {
        'name': name,
        'outgoing': price,
      },
    );
  }

  Stream<List<AttractionModel>> getAttractionStream() {
    return FirebaseFirestore.instance.collection('attraction').snapshots().map(
      (querySnapshot) {
        return querySnapshot.docs.map(
          (doc) {
            return AttractionModel(
              id: doc.id,
              title: doc['title'],
            );
          },
        ).toList();
      },
    );
  }

  Future<void> removeAttraction({required String id}) {
    return FirebaseFirestore.instance.collection('attraction').doc(id).delete();
  }

  Future<void> addAttraction({required String title}) {
    return FirebaseFirestore.instance.collection('attraction').add(
      {
        'title': title,
      },
    );
  }
}
