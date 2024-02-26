import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NPPrimaryButton extends StatelessWidget {
  const NPPrimaryButton({
    required this.text,
    required this.onPressed,
    this.isProgress = false,
    super.key,
  });

  final String? text;
  final VoidCallback onPressed;
  final bool isProgress;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: const Color(0xFFC69BFF),
        backgroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(
          horizontal: 32,
          vertical: 16,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32),
        ),
        elevation: 15,
        shadowColor: const Color(0xFFDFE9F5).withOpacity(0.25),
      ),
      onPressed: isProgress ? () {} : onPressed,
      child: Stack(
        children: [
          Text(
            text ?? '',
            style: GoogleFonts.montserrat(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: isProgress ? Colors.transparent : Colors.black,
            ),
          ),
          if (isProgress)
            const Center(
              child: SizedBox(
                height: 24,
                width: 24,
                child: CircularProgressIndicator(
                  color: Color(0xFF9168C6),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
