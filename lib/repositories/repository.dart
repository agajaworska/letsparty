import 'package:letsparty/data/remote_data_sources/remote_data_source.dart';

import 'package:letsparty/models/addSpendings_model.dart';
import 'package:letsparty/models/attraction_model.dart';
import 'package:letsparty/models/budget_model.dart';
import 'package:letsparty/models/date_model.dart';
import 'package:letsparty/models/menu_model.dart';
import 'package:letsparty/models/theme_model.dart';
import 'package:letsparty/models/user_model.dart';

class Repository {
  Repository(
    this.remoteDataSource,
  );

  final RemoteDataSource remoteDataSource;

  Stream<List<DateModel>> getItemsStream() {
    return remoteDataSource.getItemsStream().map(
      (querySnapshot) {
        return querySnapshot.docs.map(
          (doc) {
            return DateModel(
              id: doc.id,
              city: doc['city'],
              adress: doc['adress'],
              date: (doc['date']).toDate(),
              time: doc['time'],
            );
          },
        ).toList();
      },
    );
  }

  Future<void> removeItems({required String id}) {
    return remoteDataSource.removeItems(id: id);
  }

  Future<void> updateItems({
    required String id,
    required String city,
    required String adress,
    required DateTime date,
    required String time,
  }) async {
    await remoteDataSource.updateItems(
        id: id, city: city, adress: adress, date: date, time: time);
  }

  Future<void> addDateItems(
      {required String city,
      required String adress,
      required DateTime date,
      required String time}) {
    return remoteDataSource.addDateItems(
        city: city, adress: adress, date: date, time: time);
  }

  Stream<List<MenuModel>> getMenuStream() {
    return remoteDataSource.getMenuStream().map(
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

  Future<void> addMenuDocuments({required String title}) {
    return remoteDataSource.addMenuDocuments(title: title);
  }

  Future<void> removeMenu({required String id}) {
    return remoteDataSource.removeMenu(id: id);
  }

  Stream<List<ThemeModel>> getThemeStream() {
    return remoteDataSource.getThemeStream().map(
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

  Future<void> addThemePhoto({required String imageUrl}) {
    return remoteDataSource.addThemePhoto(imageUrl: imageUrl);
  }

  Future<ThemeModel> getPhoto(
      {required String id, required String imageUrl}) async {
    final doc = await remoteDataSource.getPhoto(id: id, imageUrl: imageUrl);
    return ThemeModel(
      id: doc.id,
      imageUrl: doc.imageUrl,
    );
  }

  Future<void> removeThemePhoto({required String id}) {
    return remoteDataSource.removeThemePhoto(id: id);
  }

  Stream<List<UserModel>> getUserStream() {
    return remoteDataSource.getUserStream().map(
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

  Future<void> addUserItems({required String name, required String photo}) {
    return remoteDataSource.addUserItems(name: name, photo: photo);
  }

  Future<void> removeUserItems({required String id}) {
    return remoteDataSource.removeUserItems(id: id);
  }

  Stream<List<BudgetModel>> getBudgetStream() {
    return remoteDataSource.getBudgetStream().map(
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

  Future<void> addBudgetDocuments({required String data}) {
    return remoteDataSource.addBudgetDocuments(data: data);
  }

  Future<void> updateBudgetDocuments(
      {required String id, required String data}) {
    return remoteDataSource.updateBudgetDocuments(id: id, data: data);
  }

  Future<void> removeBudgetDocuments({required String id}) {
    return remoteDataSource.removeBudgetDocuments(id: id);
  }

  Stream<List<AddSpendingsModel>> getAddSpendingsStream() {
    return remoteDataSource.getAddSpendingsStream().map(
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

  Future<void> addSpendings({required String name, required String price}) {
    return remoteDataSource.addSpendings(name: name, price: price);
  }

  Future<void> removeSpendings({required String id}) {
    return remoteDataSource.removeSpendings(id: id);
  }

  Stream<List<AttractionModel>> getAttractionStream() {
    return remoteDataSource.getAttractionStream().map(
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

  Future<void> addAttraction({required String title}) {
    return remoteDataSource.addAttraction(title: title);
  }

  Future<void> removeAttraction({required String id}) {
    return remoteDataSource.removeAttraction(id: id);
  }
}
