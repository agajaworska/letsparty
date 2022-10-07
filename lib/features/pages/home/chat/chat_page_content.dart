import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import 'package:letsparty/constants/constants.dart';
import 'package:letsparty/data/remote_data_sources/chat_remote_data_sources.dart';
import 'package:letsparty/domain/models/chat_model.dart';
import 'package:letsparty/domain/repositories/chat_repository.dart';
import 'package:letsparty/features/cubit/root_cubit.dart';
import 'package:letsparty/features/pages/home/chat/cubit/chat_cubit.dart';

class ChatPageContent extends StatefulWidget {
  @override
  _ChatPageContentState createState() => _ChatPageContentState();
}

class _ChatPageContentState extends State<ChatPageContent> {
  String messageText = '';
  final user = FirebaseAuth.instance.currentUser;
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ChatCubit(ChatRepository(ChatRemoteDataSource()))..start(),
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 212, 208, 245),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 212, 208, 245),
          title: Text(
            'C H A T',
            style: GoogleFonts.bebasNeue(
              fontSize: 35,
              color: Colors.grey.shade900,
            ),
          ),
        ),
        body: SafeArea(
          child: BlocBuilder<ChatCubit, ChatState>(
            builder: (context, state) {
              final messages = state.messages;
              final currentUser = user!.email;

              return Expanded(
                child: ListView(
                  children: [
                    for (final message in messages)
                      if (currentUser == message.sender)
                        MessageViewBox(
                          message: message,
                          isMe: currentUser == message.sender,
                        ),
                    Container(
                      decoration: messageBoxDecoration,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Expanded(
                            child: TextField(
                              controller: controller,
                              onChanged: (value) {
                                messageText = value;
                              },
                              decoration: messageTextFieldDecoration,
                            ),
                          ),
                          IconButton(
                              color: Colors.deepPurple,
                              icon: const Icon(
                                Ionicons.send_outline,
                              ),
                              onPressed: () {
                                context.read<ChatCubit>().sendMessage(
                                      text: messageText,
                                      email: user!.email!.toString(),
                                    );
                                controller.clear();
                              }),
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class MessageViewBox extends StatelessWidget {
  const MessageViewBox({
    Key? key,
    required this.message,
    required this.isMe,
  }) : super(key: key);

  final ChatModel message;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        Text(
          message.sender,
          style: const TextStyle(
            fontFamily: 'Montsserat',
            fontSize: 14,
            color: Colors.black54,
          ),
        ),
        Container(
          padding: const EdgeInsets.all(15),
          margin: const EdgeInsets.fromLTRB(
            15.0,
            5.0,
            15.0,
            25.0,
          ),
          decoration: BoxDecoration(
            color: isMe
                ? const Color.fromARGB(255, 240, 234, 255)
                : Colors.purpleAccent,
            borderRadius: isMe
                ? const BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    bottomLeft: Radius.circular(20.0),
                    bottomRight: Radius.circular(20.0),
                  )
                : const BorderRadius.only(
                    topRight: Radius.circular(20.0),
                    bottomLeft: Radius.circular(20.0),
                    bottomRight: Radius.circular(20.0),
                  ),
            boxShadow: [
              BoxShadow(
                offset: const Offset(5, 5),
                blurRadius: 6.0,
                color: Colors.grey.shade600,
              ),
              const BoxShadow(
                offset: Offset(-3, -3),
                blurRadius: 6.0,
                color: Color.fromARGB(255, 232, 222, 240),
              ),
            ],
          ),
          child: Text(
            message.text,
            style: const TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }
}
