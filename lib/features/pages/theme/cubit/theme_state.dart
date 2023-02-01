part of 'theme_cubit.dart';

class ThemeState {
  final List<ThemeModel> documents;
  final bool isLoading;
  final String errorMessage;

  const ThemeState({
    required this.documents,
    required this.isLoading,
    required this.errorMessage,
  });
}
