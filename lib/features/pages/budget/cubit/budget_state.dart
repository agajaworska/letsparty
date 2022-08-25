part of 'budget_cubit.dart';

class BudgetState {
  const BudgetState({
    this.documents = const [],
    this.errorMessage = '',
    this.isLoading = false,
  });

  final List<BudgetModel> documents;
  final String errorMessage;
  final bool isLoading;
}
