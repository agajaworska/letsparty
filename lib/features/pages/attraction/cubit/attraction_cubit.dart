import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:letsparty/models/attraction_model.dart';
import 'package:letsparty/repositories/repository.dart';
import 'package:meta/meta.dart';

part 'attraction_state.dart';

class AttractionCubit extends Cubit<AttractionState> {
  AttractionCubit(this._repository)
      : super(const AttractionState(
          documents: [],
          errorMessage: '',
          isLoading: false,
        ));

  final Repository _repository;
  StreamSubscription? _streamSubscription;

  Future<void> start() async {
    emit(
      const AttractionState(
        documents: [],
        errorMessage: '',
        isLoading: true,
      ),
    );
    _streamSubscription = _repository.getAttractionStream().listen((documents) {
      final attractionModels = documents;
      emit(
        AttractionState(
          documents: attractionModels,
          isLoading: false,
          errorMessage: '',
        ),
      );
    })
      ..onError((error) {
        emit(
          AttractionState(
            documents: const [],
            isLoading: false,
            errorMessage: error.toString(),
          ),
        );
      });
  }

  Future<void> add({required String title}) async {
    try {
      await _repository.addAttraction(title: title);
      emit(AttractionState(
        documents: state.documents,
        errorMessage: '',
        isLoading: false,
      ));
    } catch (error) {
      emit(AttractionState(
        documents: const [],
        errorMessage: error.toString(),
        isLoading: false,
      ));
    }
  }

  Future<void> remove({required String documentID}) async {
    try {
      await _repository.removeAttraction(id: documentID);
    } catch (error) {
      emit(
        AttractionState(
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
