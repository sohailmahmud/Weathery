import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weatherapp/presentation/controllers/weather_controller.dart';
import 'package:weatherapp/core/theme/app_colors.dart';
import 'package:weatherapp/presentation/widgets/widgets.dart';

const Color _blueLight = AppColors.morphismDark;
const Color _blueLighter = AppColors.morphismMedium;
const Color _redLight = AppColors.errorLight;
const Color _redLighter = AppColors.errorLight2;

class HomeScreen extends GetView<WeatherController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: GetX<WeatherController>(
        builder: (controller) {
          if (controller.isLoading.value) {
            return const GradientBackground(
              colors: [_blueLight, _blueLighter],
              child: Center(
                child: CircularProgressIndicator(color: Colors.white),
              ),
            );
          }

          if (controller.errorMessage.value.isNotEmpty) {
            return GradientBackground(
              colors: const [_redLight, _redLighter],
              child: ErrorState(controller: controller),
            );
          }

          final data = controller.weather.value;
          if (data == null) {
            return const GradientBackground(
              colors: [_blueLight, _blueLighter],
              child: Center(
                child: Text('No data', style: TextStyle(color: Colors.white)),
              ),
            );
          }

          return GradientBackground(
            colors: const [_blueLight, _blueLighter],
            child: WeatherContent(controller: controller, data: data),
          );
        },
      ),
    );
  }
}
