part of 'attraction_cubit.dart';

@immutable
class AttractionState {
  final List<QueryDocumentSnapshot<Map<String, dynamic>>> documents;
  final bool isLoading;
  final String errorMessage;

  const AttractionState({
    required this.documents,
    required this.isLoading,
    required this.errorMessage,
  });
}
