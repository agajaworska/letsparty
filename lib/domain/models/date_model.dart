import 'package:intl/intl.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'date_model.freezed.dart';

@freezed
class DateModel with _$DateModel {
  const DateModel._();
  factory DateModel({
    required String id,
    required String city,
    required String adress,
    required DateTime date,
    required String time,
  }) = _DateModel;

  String relaseDateFormatted() {
    return DateFormat.yMMMMd().format(date);
  }
}
// class DateModel {
//   final String id;
//   final String city;
//   final String adress;
//   final DateTime date;
//   final String time;

//   DateModel({
//     required this.id,
//     required this.city,
//     required this.adress,
//     required this.date,
//     required this.time,
//   });
// String relaseDateFormatted() {
//     return DateFormat.yMMMMd().format(date);
//   }
// }
  
