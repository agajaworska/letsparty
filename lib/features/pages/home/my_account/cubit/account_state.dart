part of 'account_cubit.dart';

@immutable
class AccountState {
  final List<UserModel> userDocs;
  final bool isLoading;
  final String errorMessage;

  const AccountState({
    required this.userDocs,
    required this.isLoading,
    required this.errorMessage,
  });
}
