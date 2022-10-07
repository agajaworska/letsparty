part of 'chat_cubit.dart';

class ChatState {
  final List<ChatModel> messages;

  final bool isLoading;
  final String errorMessage;

  const ChatState({
    required this.messages,
    required this.isLoading,
    required this.errorMessage,
  });
}
