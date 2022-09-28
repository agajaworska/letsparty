import 'package:letsparty/data/remote_data_sources/user_remote_data_source.dart';
import 'package:letsparty/domain/models/user_model.dart';

class UserRepository {
  UserRepository(
    this.userRemoteDataSource,
  );

  final UserRemoteDataSource userRemoteDataSource;

  Stream<List<UserModel>> getUserStream() {
    return userRemoteDataSource.getUserStream().map(
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
    return userRemoteDataSource.addUserItems(name: name, photo: photo);
  }

  Future<void> removeUserItems({required String id}) {
    return userRemoteDataSource.removeUserItems(id: id);
  }
}
