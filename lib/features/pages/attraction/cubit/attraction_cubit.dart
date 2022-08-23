import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:letsparty/models/attraction_model.dart';
import 'package:meta/meta.dart';

part 'attraction_state.dart';

class AttractionCubit extends Cubit<AttractionState> {
  AttractionCubit()
      : super(const AttractionState(
          attractionItems: [],
          errorMessage: '',
          isLoading: false,
        ));

  StreamSubscription? _streamSubscription;

  Future<void> start() async {
    emit(
      const AttractionState(
        attractionItems: [],
        errorMessage: '',
        isLoading: true,
      ),
    );
    _streamSubscription = FirebaseFirestore.instance
        .collection('attraction')
        .snapshots()
        .listen((documents) {
      final attractionModels = documents.docs.map((doc) {
        return AttractionModel(id: doc.id, title: doc['title']);
      }).toList();
      emit(
        AttractionState(
          attractionItems: attractionModels,
          isLoading: false,
          errorMessage: '',
        ),
      );
    })
      ..onError((error) {
        emit(
          AttractionState(
            attractionItems: const [],
            isLoading: false,
            errorMessage: error.toString(),
          ),
        );
      });
  }

  Future<void> add({required String title}) async {
    try {
      await FirebaseFirestore.instance.collection('attraction').add(
        {
          'title': title,
        },
      );
      emit(AttractionState(
        attractionItems: state.attractionItems,
        errorMessage: '',
        isLoading: false,
      ));
    } catch (error) {
      emit(AttractionState(
        attractionItems: const [],
        errorMessage: error.toString(),
        isLoading: false,
      ));
    }
  }

  Future<void> remove({required String documentID}) async {
    try {
      await FirebaseFirestore.instance
          .collection('attraction')
          .doc(documentID)
          .delete();
    } catch (error) {
      emit(
        AttractionState(
            errorMessage: error.toString(),
            attractionItems: [],
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
