import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';

@freezed
class UserModel with _$UserModel {
  factory UserModel({
    required String id,
    required String name,
    required String photo,
  }) = _UserModel;
}
