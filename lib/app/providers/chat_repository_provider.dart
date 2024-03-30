import 'package:flutter/material.dart';
import 'package:native_pal_gemini/chat/domain/repository/chat_repository.dart';

class ChatRepositoryProvider extends InheritedWidget {
  final ChatRepository chatRepository;

  const ChatRepositoryProvider({
    super.key,
    required super.child,
    required this.chatRepository,
  });

  @override
  bool updateShouldNotify(ChatRepositoryProvider oldWidget) =>
      oldWidget.chatRepository != chatRepository;

  static ChatRepository of(BuildContext context) {
    final provider =
        context.getInheritedWidgetOfExactType<ChatRepositoryProvider>();

    if (provider == null) {
      throw 'No ChatRepositoryProvider found in context';
    }

    return provider.chatRepository;
  }
}
