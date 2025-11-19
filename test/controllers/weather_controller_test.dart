import 'package:flutter_test/flutter_test.dart';
import 'package:weatherapp/domain/entities/weather_entity.dart';
import 'package:weatherapp/domain/repositories/weather_repository.dart';
import 'package:weatherapp/domain/usecases/get_weather_usecase.dart';
import 'package:weatherapp/presentation/controllers/weather_controller.dart';

// Stub implementation for testing
class StubWeatherRepository implements WeatherRepository {
  @override
  Future<WeatherEntity> getWeatherByCoordinates({
    required double latitude,
    required double longitude,
  }) async {
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    return WeatherEntity(
      cityName: 'Test City',
      temperature: 20.0,
      condition: 'Clear',
      iconCode: '01d',
      minTemp: 15.0,
      maxTemp: 25.0,
      latitude: latitude,
      longitude: longitude,
      timestamp: timestamp,
    );
  }
}

void main() {
  group('WeatherController', () {
    late WeatherController weatherController;
    late GetWeatherUseCase getWeatherUseCase;

    setUp(() {
      final repository = StubWeatherRepository();
      getWeatherUseCase = GetWeatherUseCase(repository);
      weatherController = WeatherController(getWeatherUseCase);
    });

    test('getWeatherIconUrl returns correct URL format', () {
      final iconCode = '01d';
      final expectedUrl = 'https://openweathermap.org/img/wn/01d@4x.png';

      expect(weatherController.getWeatherIconUrl(iconCode), expectedUrl);
    });

    test('getWeatherIconUrl works with different weather codes', () {
      expect(
        weatherController.getWeatherIconUrl('02d'),
        'https://openweathermap.org/img/wn/02d@4x.png',
      );
      expect(
        weatherController.getWeatherIconUrl('09n'),
        'https://openweathermap.org/img/wn/09n@4x.png',
      );
      expect(
        weatherController.getWeatherIconUrl('10d'),
        'https://openweathermap.org/img/wn/10d@4x.png',
      );
    });

    test('observable properties are initialized correctly', () {
      expect(weatherController.weather.value, isNull);
      expect(weatherController.isLoading.value, isFalse);
      expect(weatherController.errorMessage.value, isEmpty);
      expect(weatherController.isPermanentlyDenied.value, isFalse);
    });
  });
}

