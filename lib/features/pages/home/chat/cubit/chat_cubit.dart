import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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

  Future<void> sendMessage({
    required String text,
    required String email,
  }) async {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId == null) {
      throw Exception('User is not logged in');
    }
    await FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('messages')
        .add({
      'text': text,
      'sender': email,
      'timestamp': FieldValue.serverTimestamp(),
    });
  }
}
