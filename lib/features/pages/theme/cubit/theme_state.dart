part of 'theme_cubit.dart';

@immutable
class ThemeState {
  final List<QueryDocumentSnapshot<Map<String, dynamic>>> documents;
  final bool isLoading;
  final String errorMessage;

  const ThemeState({
    required this.documents,
    required this.isLoading,
    required this.errorMessage,
  });
}
