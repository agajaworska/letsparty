import 'package:bloc/bloc.dart';
import 'package:letsparty/app/core/enums/enums.dart';
import 'package:letsparty/domain/repositories/group_repository.dart';

part 'create_group_state.dart';

class CreateGroupCubit extends Cubit<CreateGroupState> {
  CreateGroupCubit(this.groupRepository)
      : super(CreateGroupState(errorMessage: '', status: Status.initial));

  final GroupRepository groupRepository;

  Future<void> createGroup({
    required String groupName,
    required String userName,
    required String groupId,
  }) async {
    try {
      await groupRepository.createGroup(
        groupName: groupName,
        userName: userName,
      );
      emit(CreateGroupState(
        errorMessage: '',
        status: Status.success,
      ));
    } catch (error) {
      emit(CreateGroupState(
        errorMessage: error.toString(),
        status: Status.error,
      ));
    }
  }
}
