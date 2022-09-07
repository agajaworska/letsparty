import 'package:bloc/bloc.dart';
import 'package:letsparty/models/theme_model.dart';
import 'package:letsparty/repositories/repository.dart';
import 'package:meta/meta.dart';

part 'details_theme_state.dart';

class DetailsThemeCubit extends Cubit<DetailsThemeState> {
  DetailsThemeCubit(this._repository)
      : super(DetailsThemeState(themeModel: null));

  final Repository _repository;

  Future<void> getPhotoWithId(String id) async {
    final themeModel = await _repository.getPhoto(id: id);
    emit(DetailsThemeState(themeModel: themeModel));
  }
}
