import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:letsparty/models/user_models.dart';
import 'package:meta/meta.dart';

part 'account_state.dart';

class AccountCubit extends Cubit<AccountState> {
  AccountCubit()
      : super(const AccountState(
          items: [],
          errorMessage: '',
          isLoading: false,
        ));
  StreamSubscription? _streamSubscription;

  Future<void> start() async {
    emit(
      const AccountState(
        items: [],
        errorMessage: '',
        isLoading: true,
      ),
    );
    _streamSubscription =
        FirebaseFirestore.instance.collection('user').snapshots().listen(
      (items) {
        final userModels = items.docs.map((doc) {
          return UserModel(name: doc['name'], photo: doc['photo'], id: doc.id);
        }).toList();
        emit(
          AccountState(
            items: userModels,
            isLoading: false,
            errorMessage: '',
          ),
        );
      },
    )..onError((error) {
            emit(
              AccountState(
                items: const [],
                isLoading: false,
                errorMessage: error.toString(),
              ),
            );
          });
  }

  Future<void> add({required String? name, required String? photo}) async {
    try {
      await FirebaseFirestore.instance.collection('user').add(
        {
          'name': name,
          'photo': photo,
        },
      );
      emit(AccountState(
        items: state.items,
        errorMessage: '',
        isLoading: false,
      ));
    } catch (error) {
      emit(AccountState(
        items: const [],
        errorMessage: error.toString(),
        isLoading: false,
      ));
    }
  }

  Future<void> remove({required String documentID}) async {
    try {
      await FirebaseFirestore.instance
          .collection('user')
          .doc(documentID)
          .delete();
    } catch (error) {
      emit(
        AccountState(
            errorMessage: error.toString(), items: [], isLoading: false),
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
