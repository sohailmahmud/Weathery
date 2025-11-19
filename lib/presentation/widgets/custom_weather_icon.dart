import 'package:flutter/material.dart';
import 'package:weatherapp/core/utils/weather_icon_mapper.dart';

/// A custom weather icon widget that displays weather based on icon code
/// Uses Material Design icons as primary display with fallback to API images
class CustomWeatherIcon extends StatelessWidget {
  final String iconCode;
  final double size;
  final String? iconUrl;
  final bool useCustomIcon;

  const CustomWeatherIcon({
    super.key,
    required this.iconCode,
    this.size = 150.0,
    this.iconUrl,
    this.useCustomIcon = true,
  });

  @override
  Widget build(BuildContext context) {
    if (useCustomIcon) {
      return _buildCustomIcon();
    }
    return _buildApiIcon();
  }

  /// Build using Material Design custom icons
  Widget _buildCustomIcon() {
    final icon = WeatherIconMapper.getIconForCode(iconCode);
    final color = WeatherIconMapper.getColorForCode(iconCode);

    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color.withValues(alpha: 0.1),
      ),
      padding: const EdgeInsets.all(16),
      child: Icon(icon, size: size, color: color),
    );
  }

  /// Build using OpenWeatherMap API images
  Widget _buildApiIcon() {
    if (iconUrl == null) return _buildCustomIcon();

    return Image.network(
      iconUrl!,
      width: size,
      height: size,
      fit: BoxFit.contain,
      errorBuilder: (_, __, ___) => _buildCustomIcon(),
      loadingBuilder: (_, child, progress) {
        if (progress == null) return child;
        return SizedBox(
          width: size,
          height: size,
          child: const CircularProgressIndicator(color: Colors.white),
        );
      },
    );
  }
}
