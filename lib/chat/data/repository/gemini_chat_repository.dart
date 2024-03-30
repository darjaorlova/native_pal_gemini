import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:native_pal_gemini/character/domain/model/character.dart';
import 'package:native_pal_gemini/chat/domain/model/chat_message.dart';
import 'package:native_pal_gemini/chat/domain/model/chat_role.dart';
import 'package:native_pal_gemini/chat/domain/repository/chat_repository.dart';

class GeminiChatRepository implements ChatRepository {
  final String _apiKey;
  ChatSession? _chatSession;

  GeminiChatRepository(this._apiKey);

  @override
  List<ChatMessage> getMessages() {
    final session = _chatSession;
    if (session == null) {
      return [];
    }
    return session.history.skip(1).toList().reversed.map((content) {
      final text = content.parts
          .whereType<TextPart>()
          .map<String>((e) => e.text)
          .join('');
      return ChatMessage(
        message: text,
        role: content.role == 'user' ? ChatRole.user : ChatRole.pal,
      );
    }).toList();
  }

  @override
  Future<void> sendMessage(String message) async {
    final session = _chatSession;
    if (session == null) {
      return;
    }
    await session.sendMessage(Content.text(message));
  }

  @override
  Future<void> startChat(Character character) async {
    const usePreview = false;
    const geminiProModel = 'gemini-pro';
    const geminiPreviewModel = 'gemini-1.5-pro-latest';
    final model = GenerativeModel(
      model: usePreview ? geminiPreviewModel : geminiProModel,
      apiKey: _apiKey,
      generationConfig: GenerationConfig(maxOutputTokens: 100),
    );
    _chatSession = model.startChat(history: []);
    await _chatSession!.sendMessage(
      Content.text(
          'Your name is Daria, you are 26 years old. You are a software developer from Barcelona, you love cats, care for animals and are a vegetarian. Your hobbies are dancing, learning languages and traveling. You are chatting with a person learning Spanish. Their native language is English. Your task is to help them practice their Spanish. Ask questions and keep the conversation going. Speak only in Spanish. Start the conversation by introducing yourself.'),
    );
  }
}
