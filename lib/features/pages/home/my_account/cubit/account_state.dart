part of 'account_cubit.dart';

@immutable
class AccountState {
  final List<UserModel> documents;
  final bool isLoading;
  final String errorMessage;

  const AccountState({
    required this.documents,
    required this.isLoading,
    required this.errorMessage,
  });
}
