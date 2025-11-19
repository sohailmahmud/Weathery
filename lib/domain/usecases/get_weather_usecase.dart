import 'package:weatherapp/domain/entities/weather_entity.dart';
import 'package:weatherapp/domain/repositories/weather_repository.dart';

class GetWeatherUseCase {
  final WeatherRepository repository;

  GetWeatherUseCase(this.repository);

  Future<WeatherEntity> call({
    required double latitude,
    required double longitude,
  }) async {
    return await repository.getWeatherByCoordinates(
      latitude: latitude,
      longitude: longitude,
    );
  }
}
