import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:letsparty/models/date_model.dart';
import 'package:letsparty/repositories/repository.dart';

import 'package:meta/meta.dart';

part 'add_date_state.dart';

class AddDateCubit extends Cubit<AddDateState> {
  AddDateCubit(
    this._repository,
  ) : super(const AddDateState());

  final Repository _repository;

  Future<void> add(
    String city,
    String adress,
    DateTime date,
    String time,
  ) async {
    try {
      await _repository.addDateItems(
          city: city, adress: adress, date: date, time: time);
      emit(const AddDateState(saved: true));
    } catch (error) {
      emit(AddDateState(errorMessage: error.toString()));
    }
  }
}
