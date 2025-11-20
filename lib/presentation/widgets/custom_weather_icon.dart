import 'package:flutter/material.dart';

/// A weather icon widget that displays icons from OpenWeatherMap API
class CustomWeatherIcon extends StatelessWidget {
  final String iconCode;
  final double size;
  final String? iconUrl;

  const CustomWeatherIcon({
    super.key,
    required this.iconCode,
    this.size = 150.0,
    this.iconUrl,
  });

  @override
  Widget build(BuildContext context) {
    if (iconUrl == null) {
      return SizedBox(
        width: size,
        height: size,
        child: const Center(
          child: CircularProgressIndicator(color: Colors.white),
        ),
      );
    }

    return Container(
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white10,
      ),
      child: Image.network(
        iconUrl!,
        width: size,
        height: size,
        fit: BoxFit.contain,
        errorBuilder: (_, __, ___) => _buildErrorIcon(),
        loadingBuilder: (_, child, progress) {
          if (progress == null) return child;
          return SizedBox(
            width: size,
            height: size,
            child: const Center(
              child: CircularProgressIndicator(color: Colors.white),
            ),
          );
        },
      ),
    );
  }

  Widget _buildErrorIcon() {
    return SizedBox(
      width: size,
      height: size,
      child: Center(
        child: Icon(Icons.cloud, size: size * 0.5, color: Colors.white70),
      ),
    );
  }
}
