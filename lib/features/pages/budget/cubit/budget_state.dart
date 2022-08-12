part of 'budget_cubit.dart';

class BudgetState {
  const BudgetState({
    this.saved = false,
    this.documents = const [],
    this.errorMessage = '',
    this.isLoading = false,
  });

  final List<QueryDocumentSnapshot<Map<String, dynamic>>> documents;
  final String errorMessage;
  final bool isLoading;
  final bool saved;
}
