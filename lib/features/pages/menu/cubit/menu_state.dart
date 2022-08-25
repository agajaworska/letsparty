part of 'menu_cubit.dart';

@immutable
class MenuState {
  final List<MenuModel> documents;
  final bool isLoading;
  final String errorMessage;

  const MenuState({
    required this.documents,
    required this.isLoading,
    required this.errorMessage,
  });
}
