import 'package:flutter/material.dart';

class NPCircleAvatar extends StatelessWidget {
  const NPCircleAvatar({
    required this.imageUrl,
    required this.radius,
    this.bgColor,
    super.key,
  });

  final String imageUrl;
  final double radius;
  final Color? bgColor;

  @override
  Widget build(BuildContext context) {
    final bgColor = this.bgColor ?? const Color(0xFFF8FE9B);
    return CircleAvatar(
      radius: radius,
      backgroundColor: bgColor,
      backgroundImage: AssetImage(imageUrl),
    );
  }
}
