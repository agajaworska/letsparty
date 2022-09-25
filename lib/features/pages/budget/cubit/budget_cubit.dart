import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:letsparty/domain/models/budget_model.dart';
import 'package:letsparty/domain/repositories/repository.dart';
import 'package:meta/meta.dart';

part 'budget_state.dart';

class BudgetCubit extends Cubit<BudgetState> {
  BudgetCubit(this._repository)
      : super(const BudgetState(
          documents: [],
          errorMessage: '',
          isLoading: false,
        ));

  final Repository _repository;
  StreamSubscription? _streamSubscription;

  Future<void> start() async {
    _streamSubscription = _repository.getBudgetStream().listen((documents) {
      final budgetModels = documents;
      emit(
        BudgetState(
          documents: budgetModels,
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
      await _repository.addBudgetDocuments(data: data);
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
      await _repository.removeBudgetDocuments(id: documentID);
    } catch (error) {
      emit(
        BudgetState(
            errorMessage: error.toString(), documents: [], isLoading: false),
      );
    }
  }

  Future<void> update(
      {required String documentID, required String data}) async {
    await _repository.updateBudgetDocuments(id: documentID, data: data);
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
