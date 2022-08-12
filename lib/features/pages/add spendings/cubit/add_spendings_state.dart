part of 'add_spendings_cubit.dart';

class AddSpendingsState {
  const AddSpendingsState({
    this.saved = false,
    this.documents = const [],
    this.errorMessage = '',
    this.isLoading = false,
  });

  final bool saved;
  final List<QueryDocumentSnapshot<Map<String, dynamic>>> documents;
  final String errorMessage;
  final bool isLoading;
}
