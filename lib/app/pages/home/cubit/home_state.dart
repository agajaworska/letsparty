part of 'home_cubit.dart';

@immutable
class HomeState {
  final int index;
  final GNavItem gNavItem;

  const HomeState({
    required this.index,
    required this.gNavItem,
  });
}
