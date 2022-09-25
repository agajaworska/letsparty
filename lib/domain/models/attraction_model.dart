import 'package:freezed_annotation/freezed_annotation.dart';

part 'attraction_model.freezed.dart';

@freezed
class AttractionModel with _$AttractionModel {
  factory AttractionModel({
    required String id,
    required String title,
  }) = _AttractionModel;
}



// class AttractionModel {
//   final String id;
//   final String title;

//   AttractionModel({
//     required this.id,
//     required this.title,
//   });
// }
