part of 'attraction_cubit.dart';

@immutable
class AttractionState {
  final List<AttractionModel> attractionItems;
  final bool isLoading;
  final String errorMessage;

  const AttractionState({
    required this.attractionItems,
    required this.isLoading,
    required this.errorMessage,
  });
}
