part of 'date_cubit.dart';

class DateState {
  const DateState({
    this.items = const [],
    this.loadingErrorOccured = false,
    this.removingErrorOccured = false,
    this.saved = false,
    this.errorMessage = '',
  });

  final List<ItemModel> items;
  final bool loadingErrorOccured;
  final bool removingErrorOccured;
  final bool saved;
  final String errorMessage;
}
