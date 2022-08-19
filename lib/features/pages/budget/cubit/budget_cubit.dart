import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'budget_state.dart';

class BudgetCubit extends Cubit<BudgetState> {
  BudgetCubit()
      : super(const BudgetState(
          documents: [],
          errorMessage: '',
          isLoading: false,
        ));

  StreamSubscription? _streamSubscription;

  Future<void> start() async {
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

  Future<void> add({required String data}) async {
    try {
      await FirebaseFirestore.instance.collection('finance').add(
        {
          'data': data,
        },
      );
      emit(
        BudgetState(
            documents: state.documents, errorMessage: '', isLoading: false),
      );
    } catch (error) {
      emit(
        BudgetState(
            documents: [], errorMessage: error.toString(), isLoading: false),
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
        BudgetState(
            errorMessage: error.toString(), documents: [], isLoading: false),
      );
    }
  }

  Future<void> update(
      {required String documentID, required String data}) async {
    await FirebaseFirestore.instance
        .collection('finance')
        .doc(documentID)
        .update({data: 'data'});
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
