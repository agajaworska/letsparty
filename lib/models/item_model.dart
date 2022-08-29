import 'package:intl/intl.dart';

class ItemModel {
  final String id;
  final String city;
  final String adress;
  final DateTime date;
  final String time;

  ItemModel({
    required this.id,
    required this.city,
    required this.adress,
    required this.date,
    required this.time,
  });

  String relaseDateFormatted() {
    return DateFormat.yMMMMEEEEd().format(date);
  }
}
