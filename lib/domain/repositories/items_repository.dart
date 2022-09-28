import 'package:letsparty/data/remote_data_sources/items_remote_data_source.dart';
import 'package:letsparty/domain/models/date_model.dart';

class ItemsRepository {
  ItemsRepository(
    this.itemsRemoteDataSource,
  );

  final ItemsRemoteDataSource itemsRemoteDataSource;

  Stream<List<DateModel>> getItemsStream() {
    return itemsRemoteDataSource.getItemsStream().map(
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
    return itemsRemoteDataSource.removeItems(id: id);
  }

  Future<void> updateItems({
    required String id,
    required String city,
    required String adress,
    required DateTime date,
    required String time,
  }) async {
    await itemsRemoteDataSource.updateItems(
        id: id, city: city, adress: adress, date: date, time: time);
  }

  Future<void> addDateItems(
      {required String city,
      required String adress,
      required DateTime date,
      required String time}) {
    return itemsRemoteDataSource.addDateItems(
        city: city, adress: adress, date: date, time: time);
  }
}
