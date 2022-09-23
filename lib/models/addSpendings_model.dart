import 'package:freezed_annotation/freezed_annotation.dart';

part 'addSpendings_model.freezed.dart';

@freezed
class AddSpendingsModel with _$AddSpendingsModel {
  factory AddSpendingsModel({
    required String id,
    required String name,
    required String price,
  }) = _AddSpendingsModel;
}


// class AddSpendingsModel {
//   final String id;
//   final String name;
//   final String price;

//   AddSpendingsModel({
//     required this.id,
//     required this.name,
//     required this.price,
//   });
// }
