import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:native_pal_gemini/chat/presentation/view/chat_page.dart';
import 'package:native_pal_gemini/theme/assets/gen/assets.gen.dart';
import 'package:native_pal_gemini/theme/np_primary_button.dart';

class CharacterPage extends StatefulWidget {
  const CharacterPage({super.key});

  @override
  State<CharacterPage> createState() => _CharacterPageState();
}

class _CharacterPageState extends State<CharacterPage> {
  @override
  Widget build(BuildContext context) {
    final safeAreaTop = MediaQuery.of(context).padding.top;
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Assets.resources.images.bgGradient2.image(
              fit: BoxFit.fill,
            ),
          ),
          Positioned.fill(
            left: 24,
            right: 24,
            child: Column(
              children: [
                SizedBox(height: safeAreaTop + 24),
                Expanded(
                  child: Image.asset(Assets.resources.images.dariaFull.path),
                ),
                const SizedBox(height: 24),
                Text.rich(
                  textAlign: TextAlign.start,
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Daria | Barcelona\n',
                        style: GoogleFonts.montserrat(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      TextSpan(
                        text:
                            'Me llamo Daria, soy una desarrolladora de software de 26 años de Barcelona. Mis aficiones son el baile, el aprendizaje de idiomas y los viajes. Me encantan los gatos, me preocupo por los animales en general y soy vegetariana. ¡Encantada de conocerte!',
                        style: GoogleFonts.montserrat(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: NPPrimaryButton(
                    onPressed: _openChat,
                    text: 'Start chatting',
                    isProgress: false,
                  ),
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _openChat() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => const ChatPage(),
      ),
    );
  }
}
