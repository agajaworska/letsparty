import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'add_date_state.dart';

class AddDateCubit extends Cubit<AddDateState> {
  AddDateCubit() : super(const AddDateState());

  Future<void> add(
    String adress,
    DateTime date,
  ) async {
    try {
      await FirebaseFirestore.instance.collection('items').add(
        {
          'adress': adress,
          'date': date,
        },
      );
      emit(AddDateState(saved: true));
    } catch (error) {
      emit(AddDateState(errorMessage: error.toString()));
    }
  }
}
