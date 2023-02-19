import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:letsparty/domain/models/user_model.dart';
import 'package:letsparty/domain/repositories/user_repository.dart';

part 'account_state.dart';

class AccountCubit extends Cubit<AccountState> {
  AccountCubit(this.userRepository)
      : super(const AccountState(
          documents: [],
          errorMessage: '',
          isLoading: false,
        ));

  final UserRepository userRepository;
  StreamSubscription? _streamSubscription;

  Future<void> start() async {
    emit(
      const AccountState(
        documents: [],
        errorMessage: '',
        isLoading: true,
      ),
    );
    _streamSubscription = userRepository.getUserStream().listen(
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
        print(error);
      });
  }

  Future<void> add(
      {required String name,
      required String photo,
      required String groupId}) async {
    try {
      await userRepository.addUserItems(
        name: name,
        photo: photo,
        groupId: groupId,
      );
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
      await userRepository.removeUserItems(id: documentID);
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
