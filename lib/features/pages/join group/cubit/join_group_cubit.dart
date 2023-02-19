import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:letsparty/app/core/enums/enums.dart';
import 'package:letsparty/domain/repositories/group_repository.dart';
import 'package:letsparty/features/pages/join%20group/cubit/join_group_state.dart';

class JoinGroupCubit extends Cubit<JoinGroupState> {
  JoinGroupCubit(this.groupRepository)
      : super(JoinGroupState(errorMessage: '', status: Status.initial));

  final GroupRepository groupRepository;

  Future<void> joinGroup({
    required String groupId,
    required String userName,
  }) async {
    try {
      await groupRepository.joinGroup(
        groupId: groupId,
        userName: userName,
      );
      emit(JoinGroupState(
        errorMessage: '',
        status: Status.success,
      ));
    } catch (error) {
      emit(JoinGroupState(
        errorMessage: error.toString(),
        status: Status.error,
      ));
    }
  }
}
