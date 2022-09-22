import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:letsparty/models/menu_model.dart';
import 'package:letsparty/repositories/repository.dart';

part 'menu_state.dart';

class MenuCubit extends Cubit<MenuState> {
  MenuCubit(this._repository)
      : super(const MenuState(
          documents: [],
          errorMessage: '',
          isLoading: false,
        ));

  final Repository _repository;

  StreamSubscription? _streamSubscription;

  Future<void> start() async {
    emit(
      const MenuState(
        documents: [],
        errorMessage: '',
        isLoading: true,
      ),
    );
    _streamSubscription = _repository.getMenuStream().listen((documents) {
      final menuModels = documents;
      emit(
        MenuState(
          documents: menuModels,
          isLoading: false,
          errorMessage: '',
        ),
      );
    })
      ..onError((error) {
        emit(
          MenuState(
            documents: const [],
            isLoading: false,
            errorMessage: error.toString(),
          ),
        );
      });
  }

  Future<void> add({required String title}) async {
    try {
      await _repository.addMenuDocuments(title: title);
      emit(MenuState(
        documents: state.documents,
        errorMessage: '',
        isLoading: false,
      ));
    } catch (error) {
      emit(MenuState(
        documents: const [],
        errorMessage: error.toString(),
        isLoading: false,
      ));
    }
  }

  Future<void> remove({required String documentID}) async {
    try {
      await _repository.removeMenu(id: documentID);
    } catch (error) {
      emit(
        MenuState(
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
