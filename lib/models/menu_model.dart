import 'package:freezed_annotation/freezed_annotation.dart';

part 'menu_model.freezed.dart';

@freezed
class MenuModel with _$MenuModel {
  factory MenuModel({
    required String id,
    required String title,
  }) = _MenuModel;
}


// class MenuModel {
//   final String id;
//   final String title;

//   MenuModel({
//     required this.id,
//     required this.title,
//   });
// }
