import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:letsparty/domain/models/group_model.dart';
import 'package:letsparty/domain/repositories/group_repository.dart';
part 'group_state.dart';

class GroupCubit extends Cubit<GroupState> {
  GroupCubit(this.groupRepository)
      : super(
          GroupState(
            documents: [],
            errorMessage: '',
          ),
        );
  final GroupRepository groupRepository;

  StreamSubscription? _streamSubscription;

  Future<void> start() async {
    emit(
      GroupState(
        documents: [],
        errorMessage: '',
      ),
    );
    _streamSubscription = groupRepository.getGroupStream().listen((documents) {
      final groupModels = documents;
      emit(GroupState(
        documents: groupModels,
        errorMessage: '',
      ));
    })
      ..onError((error) {
        emit(
          GroupState(
            documents: const [],
            errorMessage: error.toString(),
          ),
        );
        print(error);
      });
  }
}
