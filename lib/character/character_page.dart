import 'package:flutter/material.dart';
import 'package:native_pal_gemini/gen/assets.gen.dart';

class CharacterPage extends StatefulWidget {
  const CharacterPage({super.key});

  @override
  State<CharacterPage> createState() => _CharacterPageState();
}

class _CharacterPageState extends State<CharacterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Assets.resources.images.bgGradient2.image(
              fit: BoxFit.fill,
            ),
          ),
        ],
      ),
    );
  }
}
