import 'package:flutter/material.dart';
import 'package:weatherapp/core/theme/app_colors.dart';

class TemperatureDisplay extends StatelessWidget {
  final double temperature;
  final double tempSize;
  final double degreeSize;

  const TemperatureDisplay({
    super.key,
    required this.temperature,
    required this.tempSize,
    required this.degreeSize,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          temperature.toStringAsFixed(0),
          style: TextStyle(
            color: Colors.white,
            fontSize: tempSize,
            fontWeight: FontWeight.w300,
            height: 1.0,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: tempSize * 0.12),
          child: Text(
            '°',
            style: TextStyle(
              color: AppColors.white.withValues(alpha: 0.7),
              fontSize: degreeSize,
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
      ],
    );
  }
}
