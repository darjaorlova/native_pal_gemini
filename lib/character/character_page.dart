import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:native_pal_gemini/gen/assets.gen.dart';
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
                            'My name is Daria, I’m a 26 years old software developer from Barcelona. My hobbies are dancing, language learning, traveling. I really love cats, care for animals in general and am a vegetarian. Nice to meet you!',
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
                    onPressed: () {},
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
}
