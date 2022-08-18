part of 'account_cubit.dart';

@immutable
class AccountState {
  final List<UserModel> items;
  final bool isLoading;
  final String errorMessage;

  const AccountState({
    required this.items,
    required this.isLoading,
    required this.errorMessage,
  });
}
