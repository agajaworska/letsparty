part of 'menu_cubit.dart';

@freezed
class MenuState with _$MenuState {
  factory MenuState({
    @Default([]) List<MenuModel> documents,
    @Default(Status.initial) Status status,
    String? errorMessage,
  }) = _MenuState;
}
