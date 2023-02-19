class GroupModel {
  GroupModel(
    this.id,
    this.name,
    this.leader,
    this.members,
    this.userName,
  );

  String id;
  String name;
  String leader;
  List<dynamic> members;
  List<dynamic> userName;
}
