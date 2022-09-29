import 'package:freezed_annotation/freezed_annotation.dart';

part 'menu_model.freezed.dart';

@freezed
class MenuModel with _$MenuModel {
  factory MenuModel({
    required String id,
    required String title,
  }) = _MenuModel;
}
