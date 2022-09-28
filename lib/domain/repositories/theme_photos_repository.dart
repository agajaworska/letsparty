import 'package:letsparty/data/remote_data_sources/theme_photos_remote_data_source.dart';
import 'package:letsparty/domain/models/theme_model.dart';

class ThemePhotosRepository {
  ThemePhotosRepository(
    this.themePhotosRemoteDataSource,
  );

  final ThemePhotosRemoteDataSource themePhotosRemoteDataSource;

  Stream<List<ThemeModel>> getThemeStream() {
    return themePhotosRemoteDataSource.getThemeStream().map(
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
    return themePhotosRemoteDataSource.addThemePhoto(imageUrl: imageUrl);
  }

  Future<ThemeModel> getPhoto(
      {required String id, required String imageUrl}) async {
    final doc =
        await themePhotosRemoteDataSource.getPhoto(id: id, imageUrl: imageUrl);
    return ThemeModel(
      id: doc.id,
      imageUrl: doc.imageUrl,
    );
  }

  Future<void> removeThemePhoto({required String id}) {
    return themePhotosRemoteDataSource.removeThemePhoto(id: id);
  }
}
