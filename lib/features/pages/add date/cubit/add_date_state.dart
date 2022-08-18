part of 'add_date_cubit.dart';

class AddDateState {
  const AddDateState({
    this.saved = false,
    this.errorMessage = '',
    this.documents = const [],
  });

  final bool saved;
  final String errorMessage;
  final List<QueryDocumentSnapshot<Map<String, dynamic>>> documents;
}
