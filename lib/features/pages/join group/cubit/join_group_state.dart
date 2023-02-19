import 'package:letsparty/app/core/enums/enums.dart';

class JoinGroupState {
  JoinGroupState({
    required this.errorMessage,
    required this.status,
  });

  String errorMessage;
  Status status;
}
