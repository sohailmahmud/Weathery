import 'package:get/get.dart';
import 'package:weatherapp/domain/entities/weather_entity.dart';
import 'package:weatherapp/domain/usecases/get_weather_usecase.dart';
import 'package:weatherapp/core/services/location_service.dart';

class WeatherController extends GetxController {
  final GetWeatherUseCase getWeatherUseCase;

  WeatherController(this.getWeatherUseCase);

  final Rx<WeatherEntity?> weather = Rx<WeatherEntity?>(null);
  final RxBool isLoading = false.obs;
  final RxString errorMessage = ''.obs;
  final RxBool isPermanentlyDenied = false.obs;
  final RxBool needsOpenSettings = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchWeather();
  }

  Future<void> fetchWeather() async {
    try {
      isLoading.value = true;
      errorMessage.value = '';
      isPermanentlyDenied.value = false;
      needsOpenSettings.value = false;

      // user's actual current location
      final position = await LocationService.getCurrentLocation();
      
      final weatherData = await getWeatherUseCase(
        latitude: position.latitude,
        longitude: position.longitude,
      );

      weather.value = weatherData;
    } on LocationPermissionException catch (e) {
      errorMessage.value = e.message;
      isPermanentlyDenied.value = e.isPermanentlyDenied;
      needsOpenSettings.value = e.needsSettings;
    } catch (e) {
      errorMessage.value = 'An error occurred: ${e.toString()}';
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> openAppSettings() async {
    if (isPermanentlyDenied.value) {
      await LocationService.openLocationSettings();
      // Retry after user returns from settings
      await Future.delayed(const Duration(milliseconds: 500));
      fetchWeather();
    }
  }

  String getWeatherIconUrl(String iconCode) {
    return 'https://openweathermap.org/img/wn/$iconCode@4x.png';
  }
}
