import 'package:letsparty/data/remote_data_sources/menu_remote_data_source.dart';
import 'package:letsparty/domain/models/menu_model.dart';

class MenuRepository {
  MenuRepository(
    this.menuRemoteDataSource,
  );

  final MenuRemoteDataSource menuRemoteDataSource;

  Stream<List<MenuModel>> getMenuStream() {
    return menuRemoteDataSource.getMenuStream().map(
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
    return menuRemoteDataSource.addMenuDocuments(title: title);
  }

  Future<void> removeMenu({required String id}) {
    return menuRemoteDataSource.removeMenu(id: id);
  }
}
