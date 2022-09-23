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

// class UserModel {
//   final String id;
//   final String name;
//   final String photo;

//   UserModel({
//     required this.id,
//     required this.name,
//     required this.photo,
//   });
// }
