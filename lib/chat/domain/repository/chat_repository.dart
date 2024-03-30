import 'package:native_pal_gemini/character/domain/model/character.dart';
import 'package:native_pal_gemini/chat/domain/model/chat_message.dart';

abstract class ChatRepository {
  Future<void> sendMessage(String message);

  List<ChatMessage> getMessages();

  Future<void> startChat(Character character);
}
