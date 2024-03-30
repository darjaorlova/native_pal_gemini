import 'package:equatable/equatable.dart';
import 'package:native_pal_gemini/chat/domain/model/chat_role.dart';

class ChatMessage extends Equatable {
  const ChatMessage({
    required this.message,
    required this.role,
    this.id,
    this.errorsResponse,
  });

  final String? id;
  final String message;
  final ChatRole role;
  final String? errorsResponse;

  @override
  List<Object?> get props => [
        id,
        message,
        role,
        errorsResponse,
      ];
}
