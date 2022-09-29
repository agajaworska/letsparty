import 'package:freezed_annotation/freezed_annotation.dart';

part 'theme_model.freezed.dart';

@freezed
class ThemeModel with _$ThemeModel {
  factory ThemeModel({
    required String id,
    required String imageUrl,
  }) = _ThemeModel;
}
