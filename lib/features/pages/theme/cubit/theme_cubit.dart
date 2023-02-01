import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:letsparty/domain/models/theme_model.dart';
import 'package:letsparty/domain/repositories/theme_photos_repository.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit(this._themePhotosRepository)
      : super(const ThemeState(
          documents: [],
          errorMessage: '',
          isLoading: false,
        ));

  final ThemePhotosRepository _themePhotosRepository;

  StreamSubscription? _streamSubscription;

  Future<void> start() async {
    emit(
      const ThemeState(
        documents: [],
        errorMessage: '',
        isLoading: true,
      ),
    );
    _streamSubscription =
        _themePhotosRepository.getThemeStream().listen((documents) {
      final themeModels = documents;
      emit(
        ThemeState(
          documents: themeModels,
          isLoading: false,
          errorMessage: '',
        ),
      );
    })
          ..onError((error) {
            emit(
              ThemeState(
                documents: const [],
                isLoading: false,
                errorMessage: error.toString(),
              ),
            );
          });
  }

  Future<void> add({required String imageUrl}) async {
    try {
      await _themePhotosRepository.addThemePhoto(imageUrl: imageUrl);
      emit(ThemeState(
        documents: state.documents,
        errorMessage: '',
        isLoading: false,
      ));
    } catch (error) {
      emit(ThemeState(
        documents: const [],
        errorMessage: error.toString(),
        isLoading: false,
      ));
    }
  }

  Future<void> remove({required String documentID}) async {
    try {
      await _themePhotosRepository.removeThemePhoto(id: documentID);
    } catch (error) {
      emit(
        ThemeState(
            errorMessage: error.toString(),
            documents: const [],
            isLoading: false),
      );
      start();
    }
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
