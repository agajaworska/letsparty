import 'package:letsparty/data/remote_data_sources/spendings_remote_data_source.dart';
import 'package:letsparty/domain/models/addSpendings_model.dart';

class SpendingsRepository {
  SpendingsRepository(
    this.spendingsRemoteDataSource,
  );

  final SpendingsRemoteDataSource spendingsRemoteDataSource;

  Stream<List<AddSpendingsModel>> getAddSpendingsStream() {
    return spendingsRemoteDataSource.getAddSpendingsStream().map(
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
    return spendingsRemoteDataSource.addSpendings(name: name, price: price);
  }

  Future<void> removeSpendings({required String id}) {
    return spendingsRemoteDataSource.removeSpendings(id: id);
  }
}
