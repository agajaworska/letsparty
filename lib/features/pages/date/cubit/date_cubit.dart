import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:letsparty/models/item_model.dart';
import 'package:letsparty/repositories/repository.dart';

part 'date_state.dart';

class DateCubit extends Cubit<DateState> {
  DateCubit(
    this._repository,
  ) : super(const DateState());

  final Repository _repository;

  StreamSubscription? _streamSubscription;

  Future<void> start() async {
    _streamSubscription = _repository.getItemsStream().listen(
      (items) {
        final itemModels = items;

        emit(DateState(items: itemModels));
      },
    )..onError(
        (error) {
          emit(
            const DateState(
              loadingErrorOccured: true,
            ),
          );
        },
      );
  }

  Future<void> remove({required String documentID}) async {
    try {
      await _repository.removeItems(id: documentID);
    } catch (error) {
      emit(
        const DateState(removingErrorOccured: true),
      );
      start();
    }
  }

  Future<void> update({
    required String documentID,
    required String city,
    required String adress,
    required DateTime date,
    required String time,
  }) async {
    try {
      await _repository.updateItems(
        id: documentID,
        city: city,
        adress: adress,
        date: date,
        time: time,
      );
      emit(const DateState(saved: true));
    } catch (error) {
      emit(
        DateState(
          errorMessage: error.toString(),
        ),
      );
    }
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
