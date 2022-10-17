import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:letsparty/domain/models/addSpendings_model.dart';
import 'package:letsparty/domain/repositories/spendings_repository.dart';

part 'add_spendings_state.dart';

class AddSpendingsCubit extends Cubit<AddSpendingsState> {
  AddSpendingsCubit(this._spendingsRepository)
      : super(
          const AddSpendingsState(
            documents: [],
            errorMessage: '',
            isLoading: false,
          ),
        );

  final SpendingsRepository _spendingsRepository;
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
        _spendingsRepository.getAddSpendingsStream().listen((documents) {
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
      await _spendingsRepository.addSpendings(name: name, price: price);

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
      await _spendingsRepository.removeSpendings(id: documentID);
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
