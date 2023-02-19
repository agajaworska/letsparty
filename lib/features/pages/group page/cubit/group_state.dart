part of 'group_cubit.dart';

class GroupState {
  GroupState({
    required this.documents,
    required this.errorMessage,
  });

  List<GroupModel> documents;
  String errorMessage;
}
