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
                groupId: doc['groupId']);
          },
        ).toList();
      },
    );
  }

  Future<void> addUserItems({
    required String name,
    required String photo,
    required String groupId,
  }) {
    return userRemoteDataSource.addUserItems(
        name: name, photo: photo, groupId: groupId);
  }

  Future<void> removeUserItems({required String id}) {
    return userRemoteDataSource.removeUserItems(id: id);
  }
}
