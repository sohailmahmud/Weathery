import 'package:flutter/material.dart';

/// Maps OpenWeatherMap icon codes to Material Design icons
/// Based on OpenWeatherMap icon codes: https://openweathermap.org/weather-conditions
class WeatherIconMapper {
  static const Map<String, IconData> _iconMap = {
    // Clear sky
    '01d': Icons.wb_sunny, // clear sky day
    '01n': Icons.nights_stay, // clear sky night
    // Few clouds
    '02d': Icons.wb_sunny, // few clouds day
    '02n': Icons.nights_stay, // few clouds night
    // Scattered clouds
    '03d': Icons.cloud, // scattered clouds day
    '03n': Icons.cloud, // scattered clouds night
    // Broken clouds
    '04d': Icons.cloud, // overcast clouds day
    '04n': Icons.cloud, // overcast clouds night
    // Shower rain
    '09d': Icons.grain, // shower rain day
    '09n': Icons.grain, // shower rain night
    // Rain
    '10d': Icons.cloud_queue, // rain day
    '10n': Icons.cloud_queue, // rain night
    // Thunderstorm
    '11d': Icons.flash_on, // thunderstorm day
    '11n': Icons.flash_on, // thunderstorm night
    // Snow
    '13d': Icons.ac_unit, // snow day
    '13n': Icons.ac_unit, // snow night
    // Mist/Fog
    '50d': Icons.cloud, // mist day
    '50n': Icons.cloud, // mist night
  };

  /// Get the appropriate Material Design icon for a given weather icon code
  ///
  /// [iconCode] should be a 3-character code from OpenWeatherMap
  /// (e.g., '01d', '10n', '11d')
  ///
  /// Returns the matching IconData, or [Icons.cloud] as fallback
  static IconData getIconForCode(String iconCode) {
    return _iconMap[iconCode] ?? Icons.cloud;
  }

  /// Get a color based on the weather condition
  static Color getColorForCode(String iconCode) {
    final isNight = iconCode.endsWith('n');

    if (iconCode.startsWith('01')) {
      // Clear sky
      return isNight ? const Color(0xFF2C3E50) : const Color(0xFFFFB700);
    } else if (iconCode.startsWith('02') || iconCode.startsWith('03')) {
      // Few/scattered clouds
      return isNight ? const Color(0xFF34495E) : const Color(0xFFBDC3C7);
    } else if (iconCode.startsWith('04')) {
      // Overcast
      return const Color(0xFF95A5A6);
    } else if (iconCode.startsWith('09') || iconCode.startsWith('10')) {
      // Rain
      return const Color(0xFF3498DB);
    } else if (iconCode.startsWith('11')) {
      // Thunderstorm
      return const Color(0xFF2C3E50);
    } else if (iconCode.startsWith('13')) {
      // Snow
      return const Color(0xFFECF0F1);
    } else if (iconCode.startsWith('50')) {
      // Mist/Fog
      return const Color(0xFFBDC3C7);
    }

    return const Color(0xFF95A5A6);
  }

  /// Get a description based on the weather icon code
  static String getDescriptionForCode(String iconCode) {
    final descriptions = {
      '01d': 'Clear Sky (Day)',
      '01n': 'Clear Sky (Night)',
      '02d': 'Few Clouds (Day)',
      '02n': 'Few Clouds (Night)',
      '03d': 'Scattered Clouds (Day)',
      '03n': 'Scattered Clouds (Night)',
      '04d': 'Overcast Clouds (Day)',
      '04n': 'Overcast Clouds (Night)',
      '09d': 'Shower Rain (Day)',
      '09n': 'Shower Rain (Night)',
      '10d': 'Rain (Day)',
      '10n': 'Rain (Night)',
      '11d': 'Thunderstorm (Day)',
      '11n': 'Thunderstorm (Night)',
      '13d': 'Snow (Day)',
      '13n': 'Snow (Night)',
      '50d': 'Mist (Day)',
      '50n': 'Mist (Night)',
    };

    return descriptions[iconCode] ?? 'Unknown Condition';
  }
}
