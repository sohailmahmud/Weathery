import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weatherapp/core/di/service_locator.dart';
import 'package:weatherapp/presentation/controllers/weather_controller.dart';
import 'package:weatherapp/presentation/screens/home_screen.dart';

import 'core/theme/app_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Weather App',
      theme: AppTheme.lightTheme(),
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
      initialBinding: BindingsBuilder(() {
        Get.put<WeatherController>(getIt<WeatherController>());
      }),
    );
  }
}
