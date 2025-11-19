import 'package:flutter/material.dart';
import 'package:weatherapp/presentation/controllers/weather_controller.dart';
import 'white_text.dart';
import 'temperature_display.dart';
import 'details_card.dart';
import 'refresh_button.dart';

class WeatherContentSliver extends StatelessWidget {
  final WeatherController controller;
  final dynamic data;

  const WeatherContentSliver({
    super.key,
    required this.controller,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverAppBar(
          expandedHeight: 100,
          pinned: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          flexibleSpace: FlexibleSpaceBar(
            title: WhiteText(data.cityName, size: 24),
            centerTitle: true,
            titlePadding: const EdgeInsets.only(bottom: 16),
          ),
        ),
        SliverToBoxAdapter(
          child: LayoutBuilder(
            builder: (context, constraints) {
              final isSmallScreen = constraints.maxWidth < 600;
              final isTablet = constraints.maxWidth >= 600;

              final hPadding = isSmallScreen ? 16.0 : (isTablet ? 32.0 : 48.0);
              final iconSize = isSmallScreen ? 150.0 : 200.0;
              final tempSize = isSmallScreen ? 104.0 : 140.0;
              final degreeSize = isSmallScreen ? 44.0 : 60.0;
              final conditionSize = isSmallScreen ? 18.0 : 22.0;
              final detailSize = isSmallScreen ? 16.0 : 18.0;
              final spacing8 = isSmallScreen ? 8.0 : 10.0;
              final spacing24 = isSmallScreen ? 24.0 : 32.0;
              final spacing32 = isSmallScreen ? 32.0 : 40.0;
              final spacing48 = isSmallScreen ? 48.0 : 56.0;

              return Padding(
                padding: EdgeInsets.symmetric(horizontal: hPadding),
                child: Column(
                  children: [
                    SizedBox(height: spacing32),
                    Image.network(
                      controller.getWeatherIconUrl(data.iconCode),
                      width: iconSize,
                      height: iconSize,
                      errorBuilder: (_, __, ___) => Icon(
                        Icons.cloud,
                        size: iconSize,
                        color: Colors.white.withValues(alpha: 0.4),
                      ),
                    ),
                    SizedBox(height: spacing24),
                    TemperatureDisplay(
                      temperature: data.temperature,
                      tempSize: tempSize,
                      degreeSize: degreeSize,
                    ),
                    SizedBox(height: spacing8),
                    WhiteText(data.condition, size: conditionSize, opacity: 0.95),
                    SizedBox(height: spacing8),
                    WhiteText(
                      'High: ${data.maxTemp.toStringAsFixed(0)}°  Low: ${data.minTemp.toStringAsFixed(0)}°',
                      size: detailSize,
                      opacity: 0.9,
                      bold: true,
                    ),
                    SizedBox(height: spacing48),
                    DetailsCard(data: data, isSmallScreen: isSmallScreen),
                    SizedBox(height: spacing32),
                    RefreshButton(controller: controller, isSmallScreen: isSmallScreen),
                    const SizedBox(height: 200),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
