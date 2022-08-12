import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'budget_state.dart';

class BudgetCubit extends Cubit<BudgetState> {
  BudgetCubit() : super(const BudgetState());

  StreamSubscription? _streamSubscription;

  Future<void> start() async {
    emit(
      const BudgetState(
        documents: [],
        errorMessage: '',
        isLoading: true,
      ),
    );
    _streamSubscription = FirebaseFirestore.instance
        .collection('finance')
        .snapshots()
        .listen((data) {
      emit(
        BudgetState(
          documents: data.docs,
          isLoading: false,
          errorMessage: '',
        ),
      );
    })
      ..onError((error) {
        emit(
          BudgetState(
            documents: const [],
            isLoading: false,
            errorMessage: error.toString(),
          ),
        );
      });
  }

  Future<void> add(
    String data,
  ) async {
    try {
      await FirebaseFirestore.instance.collection('finance').add(
        {
          'data': data,
        },
      );
      emit(
        const BudgetState(saved: true),
      );
    } catch (error) {
      emit(
        BudgetState(
          errorMessage: error.toString(),
        ),
      );
    }
  }

  Future<void> remove({required String documentID}) async {
    try {
      await FirebaseFirestore.instance
          .collection('finance')
          .doc(documentID)
          .delete();
    } catch (error) {
      emit(
        BudgetState(errorMessage: error.toString()),
      );
    }
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
