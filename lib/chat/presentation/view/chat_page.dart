import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:native_pal_gemini/app/providers/chat_repository_provider.dart';
import 'package:native_pal_gemini/character/domain/model/character.dart';
import 'package:native_pal_gemini/chat/presentation/widget/chat_bubble.dart';
import 'package:native_pal_gemini/chat/presentation/widget/chat_input.dart';
import 'package:native_pal_gemini/theme/assets/gen/assets.gen.dart';
import 'package:native_pal_gemini/theme/np_circle_avatar.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();

    final chatRepository = ChatRepositoryProvider.of(context);
    chatRepository
        .startChat(Character.daria)
        .then((_) => setState(() {})); // TODO character
  }

  @override
  Widget build(BuildContext context) {
    final messages = ChatRepositoryProvider.of(context).getMessages();
    return Stack(children: [
      Positioned.fill(
        child: Assets.resources.images.bgGradient1.image(
          fit: BoxFit.fill,
        ),
      ),
      Positioned.fill(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          resizeToAvoidBottomInset: true,
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(
                Platform.isIOS ? Icons.arrow_back_ios : Icons.arrow_back,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            title: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Daria',
                  style: GoogleFonts.montserrat(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 6),
                NPCircleAvatar(
                  imageUrl: Assets.resources.images.dariaAvatar.path,
                  radius: 12,
                )
              ],
            ),
            centerTitle: true,
            foregroundColor: Colors.black,
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: Stack(
            children: [
              Positioned.fill(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.8),
                    border: const Border(
                      top: BorderSide(
                        color: Color(0xFFE7D5FF),
                        width: 0.5,
                      ),
                    ),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                ),
              ),
              Positioned.fill(
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.separated(
                        reverse: true,
                        padding: const EdgeInsets.all(16),
                        separatorBuilder: (_, __) => const SizedBox(height: 8),
                        itemCount: messages.length,
                        itemBuilder: (context, index) {
                          final message = messages[index];
                          return ChatBubble(
                            text: message.message,
                            role: message.role,
                            errorsText: '', // TODO error
                            characterAvatar:
                                Assets.resources.images.dariaAvatar.path,
                          );
                        },
                      ),
                    ),
                    ChatInput(
                      enabled: true,
                      margin: MediaQuery.paddingOf(context).bottom,
                      controller: _controller,
                      onSend: _sendMessage,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ]);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _sendMessage(String message) async {
    if (message.isEmpty) return;
    await ChatRepositoryProvider.of(context).sendMessage(message);
    _controller.clear();
    setState(() {}); // TODO
  }
}
