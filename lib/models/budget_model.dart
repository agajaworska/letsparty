import 'package:freezed_annotation/freezed_annotation.dart';

part 'budget_model.freezed.dart';

@freezed
class BudgetModel with _$BudgetModel {
  factory BudgetModel({
    required String id,
    required String data,
  }) = _BudgetModel;
}


// class BudgetModel {
//   final String id;
//   final String data;

//   BudgetModel({
//     required this.id,
//     required this.data,
//   });
// }
