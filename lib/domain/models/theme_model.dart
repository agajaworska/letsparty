import 'package:freezed_annotation/freezed_annotation.dart';

part 'theme_model.freezed.dart';

@freezed
class ThemeModel with _$ThemeModel {
  factory ThemeModel({
    required String id,
    required String imageUrl,
  }) = _ThemeModel;
}

// class ThemeModel {
//   final String id;
//   final String imageUrl;

//   ThemeModel({
//     required this.id,
//     required this.imageUrl,
//   });
// }
