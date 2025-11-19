import 'package:flutter/material.dart';
import 'package:weatherapp/core/theme/app_colors.dart';

class DetailItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final bool isSmallScreen;

  const DetailItem({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
    required this.isSmallScreen,
  });

  @override
  Widget build(BuildContext context) {
    final padding = isSmallScreen ? 14.0 : 16.0;
    final iconSize = isSmallScreen ? 20.0 : 24.0;
    final labelSize = isSmallScreen ? 12.0 : 14.0;
    final valueSize = isSmallScreen ? 16.0 : 18.0;
    final spacing = isSmallScreen ? 8.0 : 10.0;

    return Container(
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.white.withValues(alpha: 0.15)),
      ),
      child: Column(
        children: [
          Icon(icon, color: AppColors.white.withValues(alpha: 0.7), size: iconSize),
          SizedBox(height: spacing),
          Text(
            label,
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.8),
              fontSize: labelSize,
              fontWeight: FontWeight.w500,
              letterSpacing: -0.2,
            ),
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: spacing * 0.5),
          Text(
            value,
            style: TextStyle(
              color: Colors.white,
              fontSize: valueSize,
              fontWeight: FontWeight.w700,
              letterSpacing: -0.2,
            ),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
