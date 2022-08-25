import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:letsparty/models/addSpendings_model.dart';
import 'package:meta/meta.dart';

part 'add_spendings_state.dart';

class AddSpendingsCubit extends Cubit<AddSpendingsState> {
  AddSpendingsCubit()
      : super(
          const AddSpendingsState(
            documents: [],
            errorMessage: '',
            isLoading: false,
          ),
        );

  StreamSubscription? _streamSubscription;

  Future<void> start() async {
    emit(
      const AddSpendingsState(
        documents: [],
        errorMessage: '',
        isLoading: true,
      ),
    );
    _streamSubscription = FirebaseFirestore.instance
        .collection('spendings')
        .snapshots()
        .listen((documents) {
      final addSpendingsModels = documents.docs.map((doc) {
        return AddSpendingsModel(
          id: doc.id,
          name: doc['name'],
          price: doc['outgoing'],
        );
      }).toList();
      emit(
        AddSpendingsState(
          documents: addSpendingsModels,
          isLoading: false,
          errorMessage: '',
        ),
      );
    })
      ..onError((error) {
        emit(
          AddSpendingsState(
            documents: const [],
            isLoading: false,
            errorMessage: error.toString(),
          ),
        );
      });
  }

  Future<void> add({
    required String name,
    required String price,
  }) async {
    try {
      await FirebaseFirestore.instance.collection('spendings').add(
        {
          'name': name,
          'outgoing': price,
        },
      );
      emit(
        AddSpendingsState(
          documents: state.documents,
          errorMessage: '',
          isLoading: false,
        ),
      );
    } catch (error) {
      emit(
        AddSpendingsState(
          errorMessage: error.toString(),
        ),
      );
    }
  }

  Future<void> remove({required String documentID}) async {
    try {
      await FirebaseFirestore.instance
          .collection('spendings')
          .doc(documentID)
          .delete();
    } catch (error) {
      emit(
        AddSpendingsState(errorMessage: error.toString()),
      );
    }
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
