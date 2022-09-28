import 'package:letsparty/data/remote_data_sources/attraction_remote_data_source.dart';
import 'package:letsparty/domain/models/attraction_model.dart';

class AttractionRepository {
  AttractionRepository(
    this.attractionRemoteDataSource,
  );

  final AttractionRemoteDataSource attractionRemoteDataSource;

  Stream<List<AttractionModel>> getAttractionStream() {
    return attractionRemoteDataSource.getAttractionStream().map(
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
    return attractionRemoteDataSource.addAttraction(title: title);
  }

  Future<void> removeAttraction({required String id}) {
    return attractionRemoteDataSource.removeAttraction(id: id);
  }
}
