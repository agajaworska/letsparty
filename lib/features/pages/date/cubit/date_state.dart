part of 'date_cubit.dart';

class DateState {
  const DateState({
    this.items = const [],
    this.loadingErrorOccured = false,
    this.removingErrorOccured = false,
  });

  final List<ItemModel> items;
  final bool loadingErrorOccured;
  final bool removingErrorOccured;
}
