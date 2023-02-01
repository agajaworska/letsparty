import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:letsparty/domain/models/chat_model.dart';
import 'package:letsparty/domain/repositories/chat_repository.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit(this.chatRepository)
      : super(const ChatState(
          messages: [],
          isLoading: true,
          errorMessage: '',
        ));

  StreamSubscription? _streamSubscription;

  final ChatRepository chatRepository;
  Future<void> start() async {
    emit(
      const ChatState(
        messages: [],
        errorMessage: '',
        isLoading: true,
      ),
    );
    _streamSubscription =
        chatRepository.getMessagesStream().listen((documents) {
      final chatModels = documents;
      emit(
        ChatState(
          messages: chatModels,
          isLoading: false,
          errorMessage: '',
        ),
      );
    })
          ..onError((error) {
            emit(
              ChatState(
                messages: const [],
                isLoading: false,
                errorMessage: error.toString(),
              ),
            );
          });
  }

  Future<void> addMessage({required String text, required String email}) async {
    try {
      await chatRepository.sendMessage(text: text, email: email);
      emit(ChatState(
        messages: state.messages,
        isLoading: false,
        errorMessage: '',
      ));
    } catch (error) {
      emit(ChatState(
        messages: const [],
        errorMessage: error.toString(),
        isLoading: false,
      ));
    }
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
