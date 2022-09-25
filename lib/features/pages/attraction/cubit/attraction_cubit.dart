import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:letsparty/app/core/enums/enums.dart';
import 'package:letsparty/domain/models/attraction_model.dart';
import 'package:letsparty/domain/repositories/repository.dart';
import 'package:meta/meta.dart';

part 'attraction_state.dart';
part 'attraction_cubit.freezed.dart';

class AttractionCubit extends Cubit<AttractionState> {
  AttractionCubit(this._repository)
      : super(AttractionState(
          documents: [],
          errorMessage: '',
          status: Status.initial,
        ));

  final Repository _repository;
  StreamSubscription? _streamSubscription;

  Future<void> start() async {
    emit(
      AttractionState(
        documents: [],
        errorMessage: '',
        status: Status.loading,
      ),
    );
    _streamSubscription = _repository.getAttractionStream().listen((documents) {
      final attractionModels = documents;
      emit(
        AttractionState(
          documents: attractionModels,
          status: Status.success,
          errorMessage: '',
        ),
      );
    })
      ..onError((error) {
        emit(
          AttractionState(
            documents: const [],
            status: Status.error,
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
        status: Status.success,
      ));
    } catch (error) {
      emit(AttractionState(
        documents: const [],
        errorMessage: error.toString(),
        status: Status.error,
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
          status: Status.error,
        ),
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
