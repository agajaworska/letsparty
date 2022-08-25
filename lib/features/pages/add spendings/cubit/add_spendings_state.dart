part of 'add_spendings_cubit.dart';

class AddSpendingsState {
  const AddSpendingsState({
    this.documents = const [],
    this.errorMessage = '',
    this.isLoading = false,
  });

  final List<AddSpendingsModel> documents;
  final String errorMessage;
  final bool isLoading;
}
