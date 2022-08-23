part of 'menu_cubit.dart';

@immutable
class MenuState {
  final List<MenuModel> menuItems;
  final bool isLoading;
  final String errorMessage;

  const MenuState({
    required this.menuItems,
    required this.isLoading,
    required this.errorMessage,
  });
}
