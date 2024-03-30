import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:native_pal_gemini/chat/domain/model/chat_role.dart';
import 'package:native_pal_gemini/chat/presentation/view/tips_page.dart';
import 'package:native_pal_gemini/main.dart';
import 'package:native_pal_gemini/theme/assets/gen/assets.gen.dart';
import 'package:native_pal_gemini/theme/np_circle_avatar.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({
    required this.text,
    required this.role,
    required this.characterAvatar,
    this.errorsText,
    super.key,
  });

  final String text;
  final ChatRole role;
  final String? errorsText;
  final String characterAvatar;

  @override
  Widget build(BuildContext context) {
    final isFromUser = role == ChatRole.user;

    return isFromUser
        ? UserChatBubble(
            text: text,
            errorsText: errorsText,
          )
        : BotChatBubble(
            text: text,
            iso: 'es',
            imageUrl: characterAvatar,
          );
  }
}

class UserChatBubble extends StatefulWidget {
  const UserChatBubble({
    required this.text,
    this.errorsText,
    super.key,
  });

  final String text;
  final String? errorsText;

  @override
  State<UserChatBubble> createState() => _UserChatBubbleState();
}

class _UserChatBubbleState extends State<UserChatBubble> {
  var _isProgress = false;

  @override
  Widget build(BuildContext context) {
    final String? errors = widget.errorsText;

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            elevation: 2,
            padding: const EdgeInsets.all(8),
            shape: const CircleBorder(),
          ),
          onPressed: () async => _openTips(context, widget.text),
          child: _isProgress
              ? const SizedBox(
                  height: 24,
                  width: 24,
                  child: CircularProgressIndicator(),
                )
              : Assets.resources.icons.icTip.svg(
                  width: 24,
                  height: 24,
                ),
        ),
        Flexible(
          child: BaseChatBubble(
            text: widget.text,
            bgColor: const Color(0xFFFFD4F4),
            txtColor: Colors.black,
            align: CrossAxisAlignment.end,
          ),
        ),
      ],
    );
  }

  Future<void> _openTips(BuildContext context, String message) async {
    setState(() {
      _isProgress = true;
    });
    final model = GenerativeModel(
      model: 'gemini-pro',
      apiKey: GEMINI_API_KEY,
      generationConfig: GenerationConfig(maxOutputTokens: 100),
    );

    final errors = await model.generateContent(
      [
        Content.text(
            'You are a language assistant. Analyse the user message and provide feedback on grammar and suggestions for improvement, synonyms, etc. Explain the errors in details. The message is "$message"')
      ],
    );

    if (errors.text?.isEmpty == true || !context.mounted) {
      setState(() {
        _isProgress = false;
      });
      return;
    }

    setState(() {
      _isProgress = false;
    });

    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: TipsPage(
          errorText: errors.text ?? '',
        ),
        contentPadding: EdgeInsets.zero,
        backgroundColor: Colors.transparent,
      ),
    );
  }
}

class BotChatBubble extends StatelessWidget {
  const BotChatBubble({
    required this.text,
    required this.iso,
    required this.imageUrl,
    super.key,
  });

  final String text;
  final String iso;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: NPCircleAvatar(
            radius: 16,
            imageUrl: imageUrl,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: BaseChatBubble(
            text: text,
            bgColor: const Color(0xFFE7D5FF),
            txtColor: Colors.black,
            align: CrossAxisAlignment.start,
          ),
        ),
      ],
    );
  }
}

class BaseChatBubble extends StatelessWidget {
  const BaseChatBubble({
    required this.text,
    required this.bgColor,
    required this.txtColor,
    required this.align,
    super.key,
  });

  final String text;
  final Color bgColor;
  final Color txtColor;
  final CrossAxisAlignment align;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: align,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: SelectableText(
            text,
            style: GoogleFonts.montserrat(
              color: txtColor,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
