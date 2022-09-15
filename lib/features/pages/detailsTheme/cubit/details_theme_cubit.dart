import 'package:bloc/bloc.dart';
import 'package:letsparty/models/theme_model.dart';
import 'package:letsparty/repositories/repository.dart';

part 'details_theme_state.dart';

class DetailsThemeCubit extends Cubit<DetailsThemeState> {
  DetailsThemeCubit(this._repository)
      : super(DetailsThemeState(themeModel: null, errorMessage: ''));

  final Repository _repository;

  Future<void> getPhotoWithId(String id, String imageUrl) async {
    try {
      final themeModel = await _repository.getPhoto(
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
