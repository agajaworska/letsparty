import 'package:cloud_firestore/cloud_firestore.dart';

class ChatModel {
  ChatModel({
    required this.text,
    required this.sender,
    required this.id,
    required this.timestamp,
  });
  final String text;
  final String sender;
  final String id;
  final FieldValue timestamp;
}
