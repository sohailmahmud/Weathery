import 'package:flutter/material.dart';
import 'package:weatherapp/core/theme/app_colors.dart';
import 'package:weatherapp/presentation/controllers/weather_controller.dart';
import 'white_text.dart';

class RefreshButton extends StatelessWidget {
  final WeatherController controller;
  final bool isSmallScreen;

  const RefreshButton({
    super.key,
    required this.controller,
    required this.isSmallScreen,
  });

  @override
  Widget build(BuildContext context) {
    final vPadding = isSmallScreen ? 14.0 : 16.0;
    final hPadding = isSmallScreen ? 24.0 : 32.0;
    final textSize = isSmallScreen ? 16.0 : 18.0;
    final iconSize = isSmallScreen ? 18.0 : 20.0;
    final spacing = isSmallScreen ? 8.0 : 10.0;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white.withValues(alpha: 0.3)),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => controller.fetchWeather(),
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: vPadding, horizontal: hPadding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.refresh, color: AppColors.white, size: iconSize),
                SizedBox(width: spacing),
                WhiteText('Refresh', size: textSize, bold: true, opacity: 1.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
