import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:letsparty/domain/models/date_model.dart';
import 'package:letsparty/domain/repositories/items_repository.dart';

part 'date_state.dart';

class DateCubit extends Cubit<DateState> {
  DateCubit(
    this._itemsRepository,
  ) : super(const DateState());

  final ItemsRepository _itemsRepository;

  StreamSubscription? _streamSubscription;

  Future<void> start() async {
    _streamSubscription = _itemsRepository.getItemsStream().listen(
      (items) {
        final dateModels = items;

        emit(DateState(items: dateModels));
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
      await _itemsRepository.removeItems(id: documentID);
    } catch (error) {
      emit(
        const DateState(removingErrorOccured: true),
      );
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
      await _itemsRepository.updateItems(
        id: documentID,
        city: city,
        adress: adress,
        date: date,
        time: time,
      );
      emit(const DateState(
        loadingErrorOccured: false,
      ));
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
