import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:letsparty/domain/models/theme_model.dart';
import 'package:letsparty/domain/repositories/theme_photos_repository.dart';

part 'details_theme_state.dart';

class DetailsThemeCubit extends Cubit<DetailsThemeState> {
  DetailsThemeCubit(this._themePhotosRepository)
      : super(DetailsThemeState(themeModel: null, errorMessage: ''));

  final ThemePhotosRepository _themePhotosRepository;

  Future<void> getPhotoWithId(String id, String imageUrl) async {
    try {
      final themeModel = await _themePhotosRepository.getPhoto(
        id: id,
        imageUrl: imageUrl,
      );
      emit(
        DetailsThemeState(
          themeModel: themeModel,
          errorMessage: '',
        ),
      );
    } catch (error) {
      emit(
        DetailsThemeState(
          themeModel: null,
          errorMessage: error.toString(),
        ),
      );
    }
  }
}
