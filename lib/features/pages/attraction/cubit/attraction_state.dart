part of 'attraction_cubit.dart';

@freezed
class AttractionState with _$AttractionState {
  factory AttractionState({
    @Default([]) List<AttractionModel> documents,
    @Default(Status.initial) Status status,
    String? errorMessage,
  }) = _AttractionState;
}
