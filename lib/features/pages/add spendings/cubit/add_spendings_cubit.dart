import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:letsparty/models/addSpendings_model.dart';
import 'package:letsparty/repositories/repository.dart';
import 'package:meta/meta.dart';

part 'add_spendings_state.dart';

class AddSpendingsCubit extends Cubit<AddSpendingsState> {
  AddSpendingsCubit(this._repository)
      : super(
          const AddSpendingsState(
            documents: [],
            errorMessage: '',
            isLoading: false,
          ),
        );

  final Repository _repository;
  StreamSubscription? _streamSubscription;

  Future<void> start() async {
    emit(
      const AddSpendingsState(
        documents: [],
        errorMessage: '',
        isLoading: true,
      ),
    );
    _streamSubscription =
        _repository.getAddSpendingsStream().listen((documents) {
      final addSpendingsModels = documents;
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
      await _repository.addSpendings(name: name, price: price);

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
      await _repository.removeSpendings(id: documentID);
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
