import 'package:flutter/material.dart';
import 'package:native_pal_gemini/app/providers/chat_repository_provider.dart';
import 'package:native_pal_gemini/character/presentation/widget/character_page.dart';
import 'package:native_pal_gemini/chat/data/repository/gemini_chat_repository.dart';
import 'package:native_pal_gemini/main.dart';

class NativePalApp extends StatelessWidget {
  const NativePalApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChatRepositoryProvider(
      chatRepository: GeminiChatRepository(GEMINI_API_KEY),
      child: MaterialApp(
        title: 'Native Pal',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.pink),
          useMaterial3: false,
        ),
        home: const CharacterPage(),
      ),
    );
  }
}
