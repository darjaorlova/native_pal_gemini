import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatInput extends StatelessWidget {
  const ChatInput({
    required this.controller,
    required this.onSend,
    required this.margin,
    required this.enabled,
    super.key,
  });

  final TextEditingController controller;
  final Function(String message) onSend;
  final double margin;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        top: 16,
        bottom: 16 + margin,
      ),
      color: Colors.white,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: TextField(
              enabled: enabled,
              controller: controller,
              minLines: 1,
              maxLines: 5,
              maxLength: 250,
              maxLengthEnforcement: MaxLengthEnforcement.enforced,
              style: GoogleFonts.montserrat(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
              decoration: InputDecoration(
                hintText: 'Type a message...',
                hintStyle: GoogleFonts.montserrat(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey[400],
                ),
                counterStyle: GoogleFonts.montserrat(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(32),
                  borderSide: const BorderSide(
                    width: 0.5,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(32),
                  borderSide: const BorderSide(
                    width: 1.5,
                    color: Color(0xFFB58AFA),
                  ),
                ),
              ),
              textCapitalization: TextCapitalization.sentences,
              keyboardType: TextInputType.multiline,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 28),
            child: IconButton(
              icon: Icon(
                Icons.send,
                color: enabled ? const Color(0xFFB58AFA) : Colors.black,
              ),
              onPressed: enabled ? () => onSend(controller.text) : null,
            ),
          ),
        ],
      ),
    );
  }
}
