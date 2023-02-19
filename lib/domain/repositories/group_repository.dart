import 'package:letsparty/data/remote_data_sources/group_remote_data_source.dart';
import 'package:letsparty/domain/models/group_model.dart';

class GroupRepository {
  GroupRepository(
    this.groupRemoteDataSource,
  );

  final GroupRemoteDataSource groupRemoteDataSource;

  Stream<List<GroupModel>> getGroupStream() {
    return groupRemoteDataSource.getGroupStream().map((querySnapshot) {
      return querySnapshot.docs.map((doc) {
        return GroupModel(
          doc.id,
          doc['name'],
          doc['leader'],
          doc['members'],
          doc['userName'],
        );
      }).toList();
    });
  }

  Future<void> createGroup({
    required String groupName,
    required String userName,
  }) {
    return groupRemoteDataSource.createGroup(
      groupName,
      userName,
    );
  }

  Future<void> joinGroup({
    required String groupId,
    required String userName,
  }) {
    return groupRemoteDataSource.joinGroup(
      groupId,
      userName,
    );
  }
}
