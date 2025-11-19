import 'package:flutter/material.dart';
import 'package:weatherapp/core/theme/app_colors.dart';

class WhiteText extends StatelessWidget {
  final String text;
  final double size;
  final double opacity;
  final bool bold;

  const WhiteText(
    this.text, {
    super.key,
    this.size = 16,
    this.opacity = 1.0,
    this.bold = false,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: AppColors.white.withValues(alpha: opacity),
        fontSize: size,
        fontWeight: bold ? FontWeight.w600 : FontWeight.w400,
        letterSpacing: -0.3,
      ),
    );
  }
}
