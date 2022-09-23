part of 'menu_cubit.dart';

@freezed
class MenuState with _$MenuState {
  factory MenuState({
    @Default([]) List<MenuModel> documents,
    @Default(Status.initial) Status status,
    String? errorMessage,
  }) = _MenuState;
}

// @immutable
// class MenuState {
//   final List<MenuModel> documents;
//   final bool isLoading;
//   final String errorMessage;

//   const MenuState({
//     required this.documents,
//     required this.isLoading,
//     required this.errorMessage,
//   });
// }
