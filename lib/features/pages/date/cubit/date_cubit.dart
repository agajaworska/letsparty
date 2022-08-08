import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:letsparty/models/item_models.dart';
import 'package:meta/meta.dart';

part 'date_state.dart';

class DateCubit extends Cubit<DateState> {
  DateCubit() : super(const DateState());

  StreamSubscription? _streamSubscription;

  Future<void> start() async {
    _streamSubscription =
        FirebaseFirestore.instance.collection('items').snapshots().listen(
      (items) {
        final itemModels = items.docs.map((doc) {
          return ItemModel(
            id: doc.id,
            adress: doc['adress'],
            date: (doc['date'] as Timestamp).toDate(),
          );
        }).toList();

        emit(DateState(items: itemModels));
      },
    )..onError(
            (error) {
              emit(
                DateState(
                  loadingErrorOccured: true,
                ),
              );
            },
          );
  }

  Future<void> remove({required String documentID}) async {
    try {
      await FirebaseFirestore.instance
          .collection('items')
          .doc(documentID)
          .delete();
    } catch (error) {
      emit(
        const DateState(removingErrorOccured: true),
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