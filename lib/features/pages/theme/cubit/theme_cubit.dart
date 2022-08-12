import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit()
      : super(const ThemeState(
          documents: [],
          errorMessage: '',
          isLoading: false,
        ));
  StreamSubscription? _streamSubscription;

  Future<void> start() async {
    emit(
      const ThemeState(
        documents: [],
        errorMessage: '',
        isLoading: true,
      ),
    );
    _streamSubscription = FirebaseFirestore.instance
        .collection('themePhotos')
        .snapshots()
        .listen((data) {
      emit(
        ThemeState(
          documents: data.docs,
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
      await FirebaseFirestore.instance.collection('themePhotos').add(
        {
          'image_url': imageUrl,
        },
      );
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
      await FirebaseFirestore.instance
          .collection('themePhotos')
          .doc(documentID)
          .delete();
    } catch (error) {
      emit(
        ThemeState(
            errorMessage: error.toString(), documents: [], isLoading: false),
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
