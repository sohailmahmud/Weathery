import 'package:flutter/material.dart';
import 'detail_item.dart';

class DetailsCard extends StatelessWidget {
  final dynamic data;
  final bool isSmallScreen;

  const DetailsCard({
    super.key,
    required this.data,
    required this.isSmallScreen,
  });

  @override
  Widget build(BuildContext context) {
    final margin = isSmallScreen ? 8.0 : 16.0;
    final padding = isSmallScreen ? 20.0 : 24.0;
    final spacing = isSmallScreen ? 12.0 : 16.0;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: margin),
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.white.withValues(alpha: 0.2)),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: DetailItem(
                  icon: Icons.thermostat,
                  label: 'Maximum',
                  value: '${data.maxTemp.toStringAsFixed(1)}°',
                  isSmallScreen: isSmallScreen,
                ),
              ),
              SizedBox(width: spacing),
              Expanded(
                child: DetailItem(
                  icon: Icons.cloud,
                  label: 'Minimum',
                  value: '${data.minTemp.toStringAsFixed(1)}°',
                  isSmallScreen: isSmallScreen,
                ),
              ),
            ],
          ),
          SizedBox(height: spacing),
          Row(
            children: [
              Expanded(
                child: DetailItem(
                  icon: Icons.location_on,
                  label: 'Latitude',
                  value: data.latitude.toString(),
                  isSmallScreen: isSmallScreen,
                ),
              ),
              SizedBox(width: spacing),
              Expanded(
                child: DetailItem(
                  icon: Icons.location_on,
                  label: 'Longitude',
                  value: data.longitude.toString(),
                  isSmallScreen: isSmallScreen,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
