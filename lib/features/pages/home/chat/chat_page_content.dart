import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import 'package:letsparty/widgets/widgets.dart';
import 'package:letsparty/data/remote_data_sources/chat_remote_data_sources.dart';
import 'package:letsparty/domain/models/chat_model.dart';
import 'package:letsparty/domain/repositories/chat_repository.dart';

import 'package:letsparty/features/pages/home/chat/cubit/chat_cubit.dart';

class ChatPageContent extends StatefulWidget {
  const ChatPageContent({super.key});

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
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 144, 222, 212),
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

              return Column(
                children: [
                  Expanded(
                    child: ListView(
                      children: [
                        for (final message in messages)
                          MessageViewBox(
                            message: message,
                            isMe: currentUser == message.sender,
                          ),
                      ],
                    ),
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
                            color: const Color(0xFF332A6F),
                            icon: const Icon(
                              Ionicons.send_outline,
                            ),
                            onPressed: () {
                              context.read<ChatCubit>().addMessage(
                                    text: messageText,
                                    email: user!.email!.toString(),
                                  );
                              controller.clear();
                            }),
                      ],
                    ),
                  )
                ],
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
        Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10.0),
          child: Text(
            message.sender,
            style: const TextStyle(
              fontFamily: 'Montsserat',
              fontSize: 14,
              color: Colors.black54,
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(15),
          margin: const EdgeInsets.fromLTRB(
            15.0,
            5.0,
            5.0,
            15.0,
          ),
          decoration: BoxDecoration(
            color: isMe
                ? const Color.fromARGB(255, 249, 193, 195)
                : const Color.fromARGB(255, 245, 232, 206),
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
            boxShadow: const [
              BoxShadow(
                offset: Offset(5, 5),
                blurRadius: 2.0,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
            ],
          ),
          child: Text(
            message.text,
            style: const TextStyle(
              fontFamily: 'Montserrat',
              color: Colors.black,
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }
}
