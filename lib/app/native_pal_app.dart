import 'package:flutter/material.dart';
import 'package:native_pal_gemini/character/character_page.dart';

class NativePalApp extends StatelessWidget {
  const NativePalApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Native Oal',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.pink),
        useMaterial3: true,
      ),
      home: const CharacterPage(),
    );
  }
}
