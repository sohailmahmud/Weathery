import 'package:flutter/material.dart';
import 'package:weatherapp/presentation/controllers/weather_controller.dart';

class ErrorState extends StatelessWidget {
  final WeatherController controller;

  const ErrorState({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isSmallScreen = constraints.maxWidth < 600;
        final iconSize = isSmallScreen ? 80.0 : 100.0;
        final titleSize = isSmallScreen ? 24.0 : 32.0;
        final textSize = isSmallScreen ? 14.0 : 16.0;
        final padding = isSmallScreen ? 32.0 : 48.0;
        final spacing = isSmallScreen ? 24.0 : 32.0;

        final isPermanentlyDenied = controller.isPermanentlyDenied.value;

        return Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  isPermanentlyDenied
                      ? Icons.location_disabled
                      : Icons.cloud_off,
                  size: iconSize,
                  color: Colors.white,
                ),
                SizedBox(height: spacing),
                Text(
                  isPermanentlyDenied
                      ? 'Location Permission Denied'
                      : 'Unable to Load Weather',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: titleSize,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: spacing / 2),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: padding),
                  child: Text(
                    controller.errorMessage.value,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white70, fontSize: textSize),
                  ),
                ),
                SizedBox(height: spacing),
                if (isPermanentlyDenied)
                  Column(
                    children: [
                      OutlinedButton(
                        onPressed: () => controller.openAppSettings(),
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: Colors.white),
                          padding: EdgeInsets.symmetric(
                            horizontal: padding * 0.66,
                            vertical: spacing / 2,
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Icons.settings,
                              color: Colors.white,
                              size: 20,
                            ),
                            SizedBox(width: spacing / 4),
                            Text(
                              'Open Settings',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: textSize,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: spacing / 2),
                    ],
                  ),
                OutlinedButton(
                  onPressed: () => controller.fetchWeather(),
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Colors.white),
                    padding: EdgeInsets.symmetric(
                      horizontal: padding * 0.66,
                      vertical: spacing / 2,
                    ),
                  ),
                  child: Text(
                    'Try Again',
                    style: TextStyle(color: Colors.white, fontSize: textSize),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
