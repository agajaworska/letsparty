import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:letsparty/models/user_model.dart';
import 'package:letsparty/repositories/repository.dart';
import 'package:meta/meta.dart';

part 'account_state.dart';

class AccountCubit extends Cubit<AccountState> {
  AccountCubit(this._repository)
      : super(const AccountState(
          documents: [],
          errorMessage: '',
          isLoading: false,
        ));
  Repository _repository;
  StreamSubscription? _streamSubscription;

  Future<void> start() async {
    emit(
      const AccountState(
        documents: [],
        errorMessage: '',
        isLoading: true,
      ),
    );
    _streamSubscription = _repository.getUserStream().listen(
      (documents) {
        final userModels = documents;
        emit(
          AccountState(
            documents: userModels,
            isLoading: false,
            errorMessage: '',
          ),
        );
      },
    )..onError((error) {
        emit(
          AccountState(
            documents: const [],
            isLoading: false,
            errorMessage: error.toString(),
          ),
        );
      });
  }

  Future<void> add({required String name, required String photo}) async {
    try {
      await _repository.addUserItems(name: name, photo: photo);
      emit(AccountState(
        documents: state.documents,
        errorMessage: '',
        isLoading: false,
      ));
    } catch (error) {
      emit(AccountState(
        documents: const [],
        errorMessage: error.toString(),
        isLoading: false,
      ));
    }
  }

  Future<void> remove({required String documentID}) async {
    try {
      await _repository.removeUserItems(id: documentID);
    } catch (error) {
      emit(
        AccountState(
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
