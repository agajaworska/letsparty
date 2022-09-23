part of 'attraction_cubit.dart';

@freezed
class AttractionState with _$AttractionState {
  factory AttractionState({
    @Default([]) List<AttractionModel> documents,
    @Default(Status.initial) Status status,
    String? errorMessage,
  }) = _AttractionState;
}




// @immutable
// class AttractionState {
//   final List<AttractionModel> documents;
//   final bool isLoading;
//   final String errorMessage;

//   const AttractionState({
//     required this.documents,
//     required this.isLoading,
//     required this.errorMessage,
//   });
// }
