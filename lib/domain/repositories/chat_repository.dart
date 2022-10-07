import 'package:letsparty/data/remote_data_sources/chat_remote_data_sources.dart';
import 'package:letsparty/domain/models/chat_model.dart';

class ChatRepository {
  ChatRepository(this.chatRemoteDataSource);

  final ChatRemoteDataSource chatRemoteDataSource;

  Stream<List<ChatModel>> getMessagesStream() {
    return chatRemoteDataSource.getMessagesStream().map(
      (querySnapshot) {
        return querySnapshot.docs.map(
          (doc) {
            return ChatModel(
              id: doc.id,
              text: doc['text'],
              sender: doc['sender'],
            );
          },
        ).toList();
      },
    );
  }
}
