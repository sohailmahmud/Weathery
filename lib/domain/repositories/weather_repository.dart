import 'package:weatherapp/domain/entities/weather_entity.dart';

abstract class WeatherRepository {
  Future<WeatherEntity> getWeatherByCoordinates({
    required double latitude,
    required double longitude,
  });
}
