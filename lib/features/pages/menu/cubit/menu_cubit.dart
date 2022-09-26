import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:letsparty/app/core/enums/enums.dart';
import 'package:letsparty/domain/models/menu_model.dart';
import 'package:letsparty/domain/repositories/repository.dart';

part 'menu_cubit.freezed.dart';
part 'menu_state.dart';

class MenuCubit extends Cubit<MenuState> {
  MenuCubit(this.repository)
      : super(MenuState(
          documents: [],
          errorMessage: '',
          status: Status.initial,
        ));

  final Repository repository;

  StreamSubscription? _streamSubscription;

  Future<void> start() async {
    emit(
      MenuState(
        documents: [],
        errorMessage: '',
        status: Status.loading,
      ),
    );
    _streamSubscription = repository.getMenuStream().listen((documents) {
      final menuModels = documents;
      emit(
        MenuState(
          documents: menuModels,
          status: Status.success,
          errorMessage: '',
        ),
      );
    })
      ..onError((error) {
        emit(
          MenuState(
            documents: const [],
            status: Status.error,
            errorMessage: error.toString(),
          ),
        );
      });
  }

  Future<void> add({required String title}) async {
    try {
      await repository.addMenuDocuments(title: title);
      emit(MenuState(
        documents: state.documents,
        errorMessage: '',
        status: Status.success,
      ));
    } catch (error) {
      emit(MenuState(
        documents: const [],
        errorMessage: error.toString(),
        status: Status.error,
      ));
    }
  }

  Future<void> remove({required String documentID}) async {
    try {
      await repository.removeMenu(id: documentID);
    } catch (error) {
      emit(
        MenuState(
            errorMessage: error.toString(),
            documents: const [],
            status: Status.error),
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
