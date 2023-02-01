import 'package:cloud_firestore/cloud_firestore.dart';

class GroupModel {
  GroupModel(
    this.id,
    this.name,
    this.leader,
    this.members,
    this.groupCreated,
  );
  String id;
  String name;
  String leader;
  List<String> members;
  Timestamp groupCreated;
}
